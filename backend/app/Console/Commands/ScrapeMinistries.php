<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\Instituicao;
use App\Models\InstituicaoDados;
use App\Models\InstituicaoTipo;
use DOMNode;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Symfony\Component\DomCrawler\Crawler;

final class ScrapeMinistries extends Command
{
    private const WIKI_URL = 'https://pt.wikipedia.org/wiki/Lista_de_minist%C3%A9rios_de_Portugal';

    private const MINISTRY_PATTERN = '/^([^\d].+?)\s*\((\d{4})(?:\s*[-\x{2013}]\s*(\d{4}|\s*presente\s*))?\)/u';

    private const SKIP_WORDS = ['de', 'do', 'da', 'dos', 'das', 'e', 'o', 'a', 'os', 'as'];

    private const REGIME_CHANGES = [
        1822 => '1822-09-07', // Independência do Brasil (transição para Monarquia Constitucional)
        1910 => '1910-10-05', // Implantação da República
        1974 => '1974-04-25', // Revolução de 25 de Abril
    ];

    protected $signature = 'scrape:ministries {--force : Force update of existing records}';

    protected $description = 'Scrape Portuguese ministries from Wikipedia (1736–1974)';

    public function handle(): void
    {
        $this->info('Starting to scrape ministries from Wikipedia (1736–1974)...');
        $startTime = microtime(true);

        try {
            $ministerioTipo = $this->createMinistryType();
            $count = $this->fetchAndProcessMinistries($ministerioTipo);

            $duration = round(microtime(true) - $startTime, 2);
            $this->info(sprintf('Completed scraping with %d ministries processed in %s seconds.', $count, $duration));
        } catch (Exception $exception) {
            $this->error('Error occurred: '.$exception->getMessage());
        }
    }

    private function createMinistryType(): InstituicaoTipo
    {
        return InstituicaoTipo::firstOrCreate(
            ['tipo' => 'Ministério'],
            [
                'uuid' => Str::uuid(),
                'codigo' => 'MIN',
                'sinopse' => 'Órgão governamental responsável por uma área específica da administração pública.',
            ]
        );
    }

    private function fetchAndProcessMinistries(InstituicaoTipo $ministerioTipo): int
    {
        $client = new Client(['timeout' => 30]);
        $response = $client->get(self::WIKI_URL);
        $crawler = new Crawler($response->getBody()->getContents());

        $this->info('Page fetched, content length: '.mb_strlen($crawler->html()));

        $count = 0;
        $this->option('force');
        $allListItems = new Crawler();

        $listItems = $crawler->filter('#mw-content-text ul li');
        $stop = false;

        $listItems->each(function (Crawler $li) use (&$allListItems, &$stop): void {
            if ($stop) {
                return;
            }

            $text = mb_trim($li->text());
            if (preg_match(self::MINISTRY_PATTERN, $text, $matches)) {
                $nome = mb_trim($matches[1]);
                $start = (int) $matches[2];
                $end = isset($matches[3]) ? (mb_trim($matches[3]) === 'presente' ? null : (int) $matches[3]) : null;

                if ($start > 1974) {
                    $stop = true;
                    $this->info(sprintf("Stopping at: '%s' (start year %d > 1974)", $text, $start));

                    return;
                }

                $node = $li->getNode(0);
                if ($node instanceof DOMNode) {
                    $allListItems->addNode($node);
                }

                $this->info(sprintf("Collected li: '%s' with start=%d, end=", $text, $start).($end ?? 'null'));
            }
        });

        $this->info('Total <li> collected: '.$allListItems->count());

        $allListItems->each(function (Crawler $node) use ($ministerioTipo, &$count): void {
            $text = mb_trim($node->text());
            if (preg_match(self::MINISTRY_PATTERN, $text, $matches)) {
                $nome = mb_trim($matches[1]);
                $start = (int) $matches[2];
                $end = isset($matches[3]) ? (mb_trim($matches[3]) === 'presente' ? null : (int) $matches[3]) : null;

                // Ajustar data de fim para 1974-04-25 se necessário
                if ($end === null || $end > 1974) {
                    $end = 1974;
                    $this->info(sprintf("Adjusted end date to 1974-04-25 for: '%s'", $text));
                }

                $this->processListMinistry($text, $nome, $start, $end, $ministerioTipo, $count);
            }
        });

        $table = $crawler->filter('table.wikitable.sortable')->first();
        $rows = $table->filter('tr');

        // Extract data
        $ministries = [];
        $currentName = ''; // Variável para armazenar o nome atual do ministério

        $rows->each(function (Crawler $row, $i) use (&$ministries, &$currentName): void {
            if ($i === 0) {
                return;
            } // Pula o cabeçalho da tabela

            $cells = $row->filter('td, th'); // Pega todas as células da linha (<td> ou <th>)
            if ($cells->count() >= 4) { // Verifica se a linha tem células suficientes
                // Extrai o texto da primeira célula
                $firstCellText = mb_trim($cells->eq(0)->text());

                // Se a primeira célula não estiver vazia, atualiza o nome atual
                if ($firstCellText !== '' && $firstCellText !== '0') {
                    $currentName = $this->extractMinistryName($cells->eq(0));
                    if ($currentName === '' || $currentName === '0') {
                        echo 'Nenhum nome encontrado para célula: '.$cells->eq(0)->html()."\n";
                    }
                }

                // Se temos um nome válido, processa os períodos
                if ($currentName !== '' && $currentName !== '0') {
                    $periods = $this->extractPeriods($cells->eq(1)); // e.g., ["1974 – atualidade"]
                    // Remova ou comente o var_dump agora que você já debugou
                    // var_dump($periods);
                    foreach ($periods as $periodString) {
                        if (is_string($periodString)) {
                            $period = $this->parsePeriod($periodString);
                        } elseif ($currentName === 'Ministério das Infraestruturas') {
                            $period = [['start' => '2022', 'end' => '2024']];
                        } elseif ($currentName === 'Ministério da Coordenação Económica') {
                            $period = [['start' => '2022', 'end' => 'atualidade']];
                        }

                        // Then check if it has the expected structure
                        if (isset($period) && $period !== [] && (isset($period[0]) && is_array($period[0]) && isset($period[0]['start']) && isset($period[0]['end']))) {
                            $ministries[] = [
                                'name' => $currentName,
                                'start' => $period[0]['start'],
                                'end' => $period[0]['end'],
                            ];
                        }

                    }
                }
            }
        });

        // var_dump($ministries);
        // Process the data
        foreach ($ministries as $ministry) {
            $name = $ministry['name'] ?? '';
            $startValue = $ministry['start'] ?? null;
            $endValue = $ministry['end'] ?? null;
            // Convert to proper types
            $start = (string) $startValue;
            $end = $endValue !== null ? (string) $endValue : null;

            $this->processPost1974Ministry($ministry['name'], $start, $end);
            $count++;
        }

        return $count;
    }

    private function processListMinistry(
        string $text,
        string $nome,
        int $start,
        ?int $end,
        InstituicaoTipo $ministerioTipo,
        int &$count
    ): void {
        if ($nome === '' || $nome === '0' || $start < 1736 || ($end !== null && $end < $start)) {
            $this->warn('Skipping invalid ministry data: '.$text);

            return;
        }

        // Excluir hardcoded "Vice-presidente do Ministério"
        if (str_contains($nome, 'Vice-presidente do Ministério')) {
            $this->info(sprintf("Skipping non-institutional entry: '%s'", $text));

            return;
        }

        $this->processMinistry($nome, $start, $end, $ministerioTipo, $count);
    }

    private function processMinistry(
        string $nome,
        int $start,
        ?int $end,
        InstituicaoTipo $ministerioTipo,
        int &$count
    ): void {
        DB::transaction(function () use ($nome, $start, $end, $ministerioTipo, &$count): void {
            $instituicao = Instituicao::where('nome', $nome)->first();

            // Ajustar data de início e fim
            $startDate = $start.'-01-01';
            $endDate = $end !== null && $end !== 0 ? (self::REGIME_CHANGES[$end] ?? $end.'-12-31') : self::REGIME_CHANGES[1974]; // Default para 1974-04-25

            if ($instituicao) {
                $dados = InstituicaoDados::where('instituicao_id', $instituicao->id)->first();
                if ($dados) {
                    // Manter a data de início mais antiga
                    $existingStart = $dados->fundacao;
                    if ($startDate < $existingStart) {
                        $dados->fundacao = $startDate;
                        $this->info(sprintf('Updated start date to %s for: %s', $startDate, $nome));
                    }

                    // Manter a data de fim mais recente, mas nunca nula
                    $existingEnd = $dados->dissolucao;
                    if ($endDate > $existingEnd) {
                        $dados->dissolucao = $endDate;
                        $this->info(sprintf('Updated end date to %s for: %s', $endDate, $nome));
                    }

                    $dados->save();
                    $this->info(sprintf('Updated existing ministry: %s (ID: %s)', $nome, $instituicao->id));
                }
            } else {
                // Criar novo registo
                $sigla = $this->generateAcronym($nome);
                $sinopse = sprintf('Ministério histórico de Portugal, ativo entre %d e %s.', $start, $endDate !== '' && $endDate !== '0' ? mb_substr($endDate, 0, 4) : '1974');
                $extinta = true; // Todos os ministérios até 1974 estão extintos

                $instituicao = Instituicao::create([
                    'uuid' => Str::uuid(),
                    'nome' => $nome,
                    'sigla' => $sigla,
                    'sinopse' => $sinopse,
                    'extinta' => $extinta,
                ]);

                InstituicaoDados::create([
                    'instituicao_id' => $instituicao->id,
                    'fundacao' => $startDate,
                    'dissolucao' => $endDate,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

                $instituicao->tipos()->attach([$ministerioTipo->id, 2]);
                $this->info(sprintf('Inserted new ministry: %s (ID: %s)', $nome, $instituicao->id));
            }

            $count++;
            $this->info(sprintf('Added/Updated %s (%s): %s to %s', $nome, $instituicao->sigla ?? $sigla, $startDate, $endDate));
        });
    }

    private function generateAcronym(string $name): string
    {
        $words = explode(' ', $name);
        $acronym = '';
        foreach ($words as $word) {
            if (in_array(mb_strtolower($word), self::SKIP_WORDS, true)) {
                continue;
            }

            if ($word !== '' && $word !== '0') {
                $acronym .= mb_strtoupper(mb_substr($word, 0, 1));
            }
        }

        return $acronym !== '' && $acronym !== '0' ? $acronym : mb_strtoupper(mb_substr($name, 0, 3));
    }

    private function extractMinistryName(Crawler $cell): string
    {
        // Tenta encontrar o texto dentro de um <p>
        $paragraph = $cell->filter('p');
        if ($paragraph->count() > 0) {
            $link = $paragraph->filter('a');
            if ($link->count() > 0) {
                return mb_trim($link->first()->text()); // Pega o texto do link dentro do <p>
            }

            return mb_trim($paragraph->first()->text()); // Fallback para o texto do <p>
        }

        // Tenta encontrar um link <a> diretamente na célula
        $link = $cell->filter('a');
        if ($link->count() > 0) {
            return mb_trim($link->first()->text());
        }

        // Fallback para o texto bruto da célula
        return mb_trim($cell->text());
    }

    private function extractPeriods(Crawler $cell): array
    {
        $spans = $cell->filter('span');
        if ($spans->count() > 0) {
            return $spans->each(fn (Crawler $span): string => mb_trim($span->text()));
        }

        return [mb_trim($cell->text())];
    }

    private function parsePeriod(string $periodString): array
    {
        // Split the string into individual periods if multiple are present
        $subPeriods = preg_split('/\s+(?=\d{4}\s*–|\d{4}\s*-\s*atualidade)/', $periodString);
        $parsedPeriods = [];

        foreach ($subPeriods as $subPeriod) {
            // Handle cases like "19781981" (assume it's "1978 – 1981")
            if (preg_match('/^\d{8}$/', $subPeriod)) {
                $start = mb_substr($subPeriod, 0, 4);
                $end = mb_substr($subPeriod, 4, 4);
                $parsedPeriods[] = ['start' => $start, 'end' => $end];

                continue;
            }

            // Split on en dash (–) or hyphen (-) with optional spaces
            $parts = preg_split('/\s*–\s*|\s*-\s*/', $subPeriod);
            if (count($parts) === 2) {
                $start = mb_trim($parts[0]);
                $end = mb_trim($parts[1]);
                // Validate: start should be a year, end should be a year or "atualidade"
                if (preg_match('/^\d{4}$/', $start) && (preg_match('/^\d{4}$/', $end) || $end === 'atualidade')) {
                    $parsedPeriods[] = ['start' => $start, 'end' => $end];
                }
            } elseif (count($parts) === 1 && preg_match('/^\d{4}$/', mb_trim($parts[0]))) {
                // Single year (e.g., "1974" or "2015")
                $parsedPeriods[] = ['start' => mb_trim($parts[0]), 'end' => null];
            }
        }

        return $parsedPeriods;
    }

    private function parseYear(string $yearString): ?string
    {
        if ($yearString === 'atualidade') {
            return null;
        }

        if (preg_match('/\d{4}/', $yearString, $matches)) {
            return $matches[0].'-01-01';
        }

        return null;
    }

    private function processPost1974Ministry(string $name, string $start, ?string $end): void
    {
        DB::transaction(function () use ($name, $start, $end): void {
            // 1. Ensure the "Ministério" type exists
            $ministerioTipo = InstituicaoTipo::firstOrCreate(
                ['tipo' => 'Ministério'],
                [
                    'uuid' => Str::uuid(),
                    'codigo' => 'MIN',
                    'sinopse' => 'Órgão governamental responsável por uma área específica da administração pública.',
                ]
            );

            // 2. Adjust the dates
            $startDate = $start.'-01-01'; // e.g., "1974-01-01"
            $endDate = ($end && $end !== 'atualidade') ? $end.'-12-31' : null; // e.g., "1985-12-31" or null

            // 3. Check if the ministry already exists in Instituicao
            $instituicao = Instituicao::where('nome', $name)->first();

            if (! $instituicao) {
                // Create a new ministry
                $sigla = $this->generateAcronym($name);
                $sinopse = sprintf('Ministério de Portugal, ativo desde %s.', $start);
                $extinta = $endDate !== null;

                $instituicao = Instituicao::create([
                    'uuid' => Str::uuid(),
                    'nome' => $name,
                    'sigla' => $sigla,
                    'sinopse' => $sinopse,
                    'extinta' => $extinta,
                ]);

                // Associate the "Ministério" type
                $instituicao->tipos()->attach([$ministerioTipo->id, 2]);
                $this->info(sprintf('Inserted new ministry: %s (ID: %s)', $name, $instituicao->id));

                // Create the initial record in InstituicaoDados
                InstituicaoDados::create([
                    'instituicao_id' => $instituicao->id,
                    'fundacao' => $startDate,
                    'dissolucao' => $endDate,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
                $this->info(sprintf('Added period for %s: %s to ', $name, $startDate).($endDate ?? 'atualidade'));
            } else {
                // Ministry exists, update the single InstituicaoDados record
                $dados = InstituicaoDados::where('instituicao_id', $instituicao->id)->first();

                if (! $dados) {
                    // If no record exists in InstituicaoDados, create one
                    $dados = InstituicaoDados::create([
                        'instituicao_id' => $instituicao->id,
                        'fundacao' => $startDate,
                        'dissolucao' => $endDate,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                    $this->info(sprintf('Added new period for %s: %s to ', $name, $startDate).($endDate ?? 'atualidade'));
                } else {
                    // Update the existing record
                    // Keep the earliest fundacao
                    // if ($startDate < $dados->fundacao) {
                    //    $dados->fundacao = $startDate;
                    //    $this->info("Updated start date to $startDate for $name");
                    // }

                    // Update dissolucao: null if active, otherwise the latest end date
                    if ($endDate === null) {
                        $dados->dissolucao = null; // "atualidade" overrides any previous end date
                        $this->info('Updated end date to atualidade for '.$name);
                    } elseif ($dados->dissolucao === null || $endDate > $dados->dissolucao) {
                        $dados->dissolucao = $endDate;
                        $this->info(sprintf('Updated end date to %s for %s', $endDate, $name));
                    }

                    $dados->save();
                }

                // Update the extinta field in Instituicao
                $instituicao->extinta = $dados->dissolucao !== null;
                $instituicao->save();
            }
        });
    }
}
