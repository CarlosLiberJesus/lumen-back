<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\Cidadao;
use App\Models\CidadaoCargo;
use App\Models\Governo;
use App\Models\Instituicao;
use App\Models\InstituicaoCargo;
use App\Models\InstituicaoGoverno;
use Carbon\Carbon;
use DOMNode;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;
use Symfony\Component\DomCrawler\Crawler;

final class ScrapePrimeMinisters extends Command
{
    // Target Wikipedia URL
    private const WIKIPEDIA_URL = 'https://pt.wikipedia.org/wiki/Lista_de_chefes_de_governo_de_Portugal';

    // Target Institution Name
    private const INSTITUICAO_NOME = 'Presidência do Conselho de Ministros';

    // Target Cargo Name
    private const CARGO_NOME = 'Presidente do Conselho de Ministros'; // Or adjust based on historical titles

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'scrape:prime-ministers';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Scrape Prime Ministers (Heads of Government) from Wikipedia';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $this->info('Starting scraping of Prime Ministers from Wikipedia...');

        // 1. Fetch HTML
        $response = Http::get(self::WIKIPEDIA_URL);
        if (! $response->successful()) {
            $this->error('Failed to fetch Wikipedia page. Status: '.$response->status());

            return Command::FAILURE;
        }

        $html = $response->body();

        // 2. Parse HTML
        $crawler = new Crawler($html);

        // Find the target institution
        $instituicaoPCM = Instituicao::where('nome', self::INSTITUICAO_NOME)->first();
        if (! $instituicaoPCM) {
            $this->error('Institution "'.self::INSTITUICAO_NOME.'" not found in the database. Seed it first.');

            return Command::FAILURE;
        }

        // --- Directly process the single table ---
        $table = $crawler->filter('table.wikitable')->first()->getNode(0);

        if (! $table instanceof DOMNode) {
            $this->error('No wikitable found on the page. Check the page structure.');

            return Command::FAILURE;
        }

        $this->info('Processing the main table.');

        $tableCrawler = new Crawler($table);
        $tableCrawler->filter('tbody > tr')->each(function (Crawler $row, $rowIndex) use ($instituicaoPCM): void {
            // Skip header rows (adjust as needed)
            if ($rowIndex < 1) {
                return;
            }

            $headerCell = $row->filter('th');
            // $this->warn($row->html());
            // $this->warn($headerCell->html());

            if ($headerCell->count() > 0 && mb_trim($headerCell->text()) === '–') {
                $this->warn(sprintf("Skipping row %s due to '-' in the first cell.", $rowIndex));

                return;
            }

            $cells = $row->filter('td');

            // --- Extract Data (Simplified) ---
            if ($cells->count() < 3) { // Need at least Name, Start
                $this->warn(sprintf('Skipping row %s due to insufficient cells (found %d).', $rowIndex, $cells->count()));

                return;
            }

            $nomeCompleto = mb_trim($cells->eq(0)->text('')); // Name from cell 1
            $inicioStr = mb_trim($cells->eq(2)->text('')); // Start date from cell 3
            $fimStr = mb_trim($cells->eq(3)->text('')); // End date from cell 4
            $this->info(sprintf('Row Attempt: %s (%s–%s)', $nomeCompleto, $inicioStr, $fimStr));
            // Basic check
            if ($nomeCompleto === '' || $nomeCompleto === '0' || ($inicioStr === '' || $inicioStr === '0')) {
                $this->warn(sprintf('Skipping row %s due to missing name/start date.', $rowIndex));

                return;
            }

            // --- Normalize Data ---
            $nomeCompleto = preg_replace('/\[\d+\]$/', '', $nomeCompleto);
            $nomeCompleto = mb_trim($nomeCompleto);

            $inicio = $this->parseDate($inicioStr);
            $fim = $this->parseDate($fimStr);

            if (! $inicio instanceof Carbon) {
                $this->warn(sprintf("Could not parse start date '%s' for %s. Skipping.", $inicioStr, $nomeCompleto));

                return;
            }

            // --- Database Logic ---
            $cidadao = Cidadao::firstOrCreate(
                ['nome_completo' => $nomeCompleto],
                ['uuid' => Str::uuid(), 'nome' => $this->extractShortName($nomeCompleto)]
            );

            // Find relevant Governo (this is complex and needs a robust strategy)
            $governo = Governo::where('formacao', '<=', $inicio->format('Y-m-d'))
                ->where(function ($query) use ($inicio): void {
                    $query->whereNull('dissolucao')
                        ->orWhere('dissolucao', '>=', $inicio->format('Y-m-d'));
                })
                ->orderBy('formacao', 'desc')
                ->first();

            if (! $governo) {
                $this->warn(sprintf('Could not find matching Governo for %s starting %s. Skipping cargo creation.', $nomeCompleto, $inicio->format('Y-m-d')));

                return;
            }

            // Find/Create InstituicaoGoverno link
            $instituicaoGoverno = InstituicaoGoverno::firstOrCreate(
                [
                    'uuid' => Str::uuid(),
                    'instituicao_id' => $instituicaoPCM->id, 'governo_id' => $governo->id,
                ],
            );

            // Find/Create InstituicaoCargo
            $instituicaoCargo = InstituicaoCargo::firstOrCreate(
                [
                    'uuid' => Str::uuid(),
                    'instituicao_id' => $instituicaoGoverno->id,
                    'tipo' => 'instituicao_governo',
                    'cargo' => self::CARGO_NOME, // May need adjustment for historical titles
                ],
            );

            // Create CidadaoCargo
            CidadaoCargo::firstOrCreate(
                [
                    'cidadao_id' => $cidadao->id,
                    'cargo_id' => $instituicaoCargo->id,
                    'inicio' => $inicio->format('Y-m-d'),
                    'fim' => $fim instanceof Carbon ? $fim->format('Y-m-d') : null,
                ]
            );

            $this->info(sprintf('Processed: %s (%s - ', $nomeCompleto, $inicio->format('Y-m-d')).($fim instanceof Carbon ? $fim->format('Y-m-d') : 'Present').sprintf(') for Governo: %s [Republica: %s]', $governo->nome, $governo->republica->nome));

        });

        $this->info('Finished scraping Prime Ministers.');

        return Command::SUCCESS;

    }

    /**
     * Attempt to parse various date formats from Wikipedia.
     * Handles formats like "DD de MMMM de YYYY".
     */
    private function parseDate(string $dateStr): ?Carbon
    {
        $dateStr = mb_trim($dateStr);
        if ($dateStr === '' || $dateStr === '0' || mb_strtolower($dateStr) === 'presente' || mb_strtolower($dateStr) === 'atualidade') {
            return null;
        }

        // Remove annotations like [nota 1]
        $dateStr = preg_replace('/\[.*?\]/', '', $dateStr);
        $dateStr = mb_trim($dateStr);

        // Portuguese month names mapping
        $months = [
            'janeiro' => 'January', 'fevereiro' => 'February', 'março' => 'March', 'abril' => 'April',
            'maio' => 'May', 'junho' => 'June', 'julho' => 'July', 'agosto' => 'August',
            'setembro' => 'September', 'outubro' => 'October', 'novembro' => 'November', 'dezembro' => 'December',
        ];

        // Replace Portuguese month names with English ones
        $dateStrLower = mb_strtolower($dateStr);
        foreach ($months as $pt => $en) {
            $dateStrLower = str_replace($pt, $en, $dateStrLower);
        }

        // Attempt parsing common formats
        try {
            // Format: DD de MMMM de YYYY
            if (preg_match('/^(\d{1,2})\s+de\s+([a-z]+)\s+de\s+(\d{4})$/i', $dateStrLower, $matches)) {
                $day = $matches[1];
                $month = ucfirst($matches[2]); // Use the English month name
                $year = $matches[3];

                return Carbon::createFromFormat('d F Y', sprintf('%s %s %s', $day, $month, $year))->startOfDay();
            }

            // Add more formats if needed (e.g., YYYY-MM-DD, DD/MM/YYYY)
            if (preg_match('/^(\d{4})-(\d{2})-(\d{2})$/', $dateStr, $matches)) {
                return Carbon::createFromFormat('Y-m-d', $dateStr)->startOfDay();
            }

            // Format: Ação Nacional Popular(desde 21 fev. 1970)
            if (preg_match('/^.*\((?:desde|de)\s*(\d{1,2})\s*([a-z]+)\s*(\d{4})\)$/i', $dateStr, $matches)) {
                $day = $matches[1];
                $month = ucfirst($matches[2]); // Use the English month name
                $year = $matches[3];

                return Carbon::createFromFormat('d F Y', sprintf('%s %s %s', $day, $month, $year))->startOfDay();
            }

        } catch (Exception $exception) {
            $this->warn(sprintf("Date parsing failed for '%s': ", $dateStr).$exception->getMessage());

            return null;
        }

        $this->warn(sprintf("Could not parse date format: '%s'", $dateStr));

        return null;
    }

    /**
     * Extracts a shorter name from a full name (basic implementation).
     */
    private function extractShortName(string $fullName): string
    {
        $parts = explode(' ', $fullName);
        // Example: Take first and last name if available
        if (count($parts) >= 2) {
            return $parts[0].' '.end($parts);
        }

        return $fullName; // Fallback to full name
    }
}
