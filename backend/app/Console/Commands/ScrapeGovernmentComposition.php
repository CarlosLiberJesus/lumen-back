<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Carbon\Carbon;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Symfony\Component\DomCrawler\Crawler;

final class ScrapeGovernmentComposition extends Command
{
    private const BASE_URL = 'https://www.historico.portugal.gov.pt';

    private const COMPOSITION_PATH = '/pt/o-governo/arquivo-historico/governos-constitucionais/gc%s/composicao.aspx';

    protected $signature = 'scrape:government-composition {government=01}';

    protected $description = 'Scrape government composition from historico.portugal.gov.pt';

    public function handle(): int
    {
        $government = $this->argument('government');
        $url = self::BASE_URL.sprintf(self::COMPOSITION_PATH, $government);

        $this->info(sprintf('Fetching composition for government %s from %s', $government, $url));

        try {
            $client = new Client(['timeout' => 30]);
            $response = $client->get($url);
            $crawler = new Crawler($response->getBody()->getContents());

            $temporalLinks = $this->extractTemporalLinks($crawler);

            // $this->info('Temporal links found:');
            // $this->line(json_encode($temporalLinks, JSON_PRETTY_PRINT));

            // Process each temporal snapshot
            $compositions = [];
            foreach ($temporalLinks as $link) {
                $this->info(sprintf('Fetching composition for date: %s', $link['date']));

                // If link is relative, make it absolute
                $compositionUrl = str_starts_with((string) $link['link'], 'http')
                    ? $link['link']
                    : self::BASE_URL.$link['link'];

                $response = $client->get($compositionUrl);
                $compositionCrawler = new Crawler($response->getBody()->getContents());

                $composition = $this->extractComposition($compositionCrawler);
                $compositions[$link['date']] = $composition;

                // $this->line(json_encode($compositions, JSON_PRETTY_PRINT));
                // exit();
                // Add small delay between requests
                sleep(1);
            }

            // Output final structure
            $this->info('Completed composition structure:');
            // $this->line(json_encode($compositions, JSON_PRETTY_PRINT));

            $this->info('Starting compating structure:');
            $finalData = $this->transformComposition(
                $compositions,
                'I',                           // Governo sigla
                'Governo Constitucional'       // Governo nome
            );
            // $this->info('Complete composition structure:');
            // $this->line(json_encode($finalData, JSON_PRETTY_PRINT));

            // Transform the data to match seeder structure
            $seederData = [
                [
                    'nome' => 'III República',
                    'inicio' => '1974-04-25',
                    'fim' => '',
                    'governos' => [
                        [
                            'sigla' => $finalData['sigla'],
                            'nome' => $finalData['nome'],
                            'instituicoes' => array_map(fn (array $ministerio): array => [
                                'nome' => $ministerio['nome'],
                                'cargos' => array_map(function ($cargo): array {
                                    $cargoData = [
                                        'nome' => $cargo['nome'],
                                        'cidadaos' => $cargo['cidadaos'],
                                    ];

                                    if (isset($cargo['subcargos'])) {
                                        $cargoData['subcargos'] = array_map(fn (array $subcargo): array => [
                                            'nome' => $subcargo['nome'],
                                            'cidadaos' => $subcargo['cidadaos'],
                                        ], $cargo['subcargos']);
                                    }

                                    return $cargoData;
                                }, $ministerio['cargos']),
                            ], array_slice($finalData, 2)), // Skip sigla and nome keys
                        ],
                    ],
                ],
            ];

            $outputPath = storage_path('app/government_composition.json');
            file_put_contents($outputPath, json_encode($seederData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
            $this->info(sprintf('Composition data saved to: %s', $outputPath));

            return Command::SUCCESS;
        } catch (Exception $exception) {
            $this->error('Error fetching data: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function extractTemporalLinks(Crawler $crawler): array
    {
        $links = [];

        $crawler->filter('.aside')->each(function (Crawler $aside) use (&$links): void {
            // $this->info('Found aside element:');
            // $this->line($aside->html());

            $aside->filter('a')->each(function (Crawler $link) use (&$links): void {
                $href = $link->attr('href');

                if (preg_match('/date=(\d{4}-\d{2}-\d{2})/', $href, $matches)) {
                    $date = $matches[1];
                } else {
                    try {
                        $dateText = mb_trim($link->text());
                        $date = Carbon::createFromFormat('d/m/Y', $dateText)->format('Y-m-d');
                    } catch (Exception) {
                        $this->warn(sprintf('Could not parse date from text: %s', $dateText));

                        return;
                    }
                }

                $links[] = [
                    'date' => $date,
                    'link' => $href,
                ];
            });
        });

        usort($links, fn ($a, $b): int => $a['date'] <=> $b['date']);

        return $links;
    }

    private function extractComposition(Crawler $crawler): array
    {
        $composition = [];

        // First handle the special case of Primeiro-Ministro in firstHistory
        $crawler->filter('.firstHistory')->each(function (Crawler $section) use (&$composition): void {
            $pmName = mb_trim($section->filter('span')->first()->text());
            $pmCargo = mb_trim($section->filter('h3')->first()->text());

            // $this->info("Found PM section:");
            // $this->info("Name: $pmName");
            // $this->info("Cargo: $pmCargo");

            $composition[$pmCargo] = [
                'nome' => $pmName,
                'subcargos' => [],
            ];

            // Handle any Secretários within firstHistory (they report to PM)
            $section->filter('ul li')->each(function (Crawler $li) use (&$composition, $pmCargo): void {
                $name = mb_trim($li->filter('span')->first()->text());
                $cargo = mb_trim($li->filter('h3')->first()->text());

                // $this->info("Found Secretary under PM:");
                // $this->info("Name: $name");
                // $this->info("Cargo: $cargo");

                $composition[$pmCargo]['subcargos'][$cargo] = [
                    'nome' => $name,
                    'subcargos' => [],
                ];
            });
        });

        // Track current minister for associating secretaries
        $currentMinister = null;
        $currentMinisterCargo = null;

        // Then handle all other ministers/secretaries
        $crawler->filter('ul.historico > li')->each(function (Crawler $li) use (&$composition, &$currentMinister, &$currentMinisterCargo): void {
            $name = mb_trim($li->filter('span')->first()->text());
            $cargo = mb_trim($li->filter('h3')->first()->text());

            // $this->info("Found Minister:");
            // $this->info("Name: $name");
            // $this->info("Cargo: $cargo");

            // Create minister entry
            $composition[$cargo] = [
                'nome' => $name,
                'subcargos' => [],
            ];

            // Check for nested secretaries
            $li->filter('ul li')->each(function (Crawler $secretaryLi) use (&$composition, $cargo): void {
                $secretaryName = mb_trim($secretaryLi->filter('span')->first()->text());
                $secretaryCargo = mb_trim($secretaryLi->filter('h3')->first()->text());

                // $this->info("Found Secretary under $cargo:");
                // $this->info("Name: $secretaryName");
                // $this->info("Cargo: $secretaryCargo");

                $composition[$cargo]['subcargos'][$secretaryCargo] = [
                    'nome' => $secretaryName,
                    'subcargos' => [],
                ];
            });
        });

        $crawler->filter('ul.historico > li')->each(function (Crawler $li) use (&$composition, &$currentMinister, &$currentMinisterCargo): void {
            $name = mb_trim($li->filter('span')->first()->text());
            $cargo = mb_trim($li->filter('h3')->first()->text());

            // $this->info("Found Minister:");
            // $this->info("Name: $name");
            // $this->info("Cargo: $cargo");

            // Create minister entry
            $composition[$cargo] = [
                'nome' => $name,
                'subcargos' => [],
            ];

            // Check for nested secretaries
            $li->filter('ul li')->each(function (Crawler $secretaryLi) use (&$composition, $cargo): void {
                $secretaryName = mb_trim($secretaryLi->filter('span')->first()->text());
                $secretaryCargo = mb_trim($secretaryLi->filter('h3')->first()->text());

                // $this->info("Found Secretary under $cargo:");
                // $this->info("Name: $secretaryName");
                // $this->info("Cargo: $secretaryCargo");

                $composition[$cargo]['subcargos'][$secretaryCargo] = [
                    'nome' => $secretaryName,
                    'subcargos' => [],
                ];
            });
        });

        return $composition;
    }

    private function transformComposition(array $scrapedData, string $governoSigla, string $governoNome): array
    {
        $transformed = [
            'sigla' => $governoSigla,
            'nome' => $governoNome,
        ];

        $ministerios = [];

        foreach ($scrapedData as $date => $composition) {
            $this->info('Processing composition for date: '.$date);

            foreach ($composition as $cargoNome => $cargoData) {
                // $this->info("Processing cargo: $cargoNome");

                // Determine the ministry name based on the cargo
                $ministerioNome = $this->getMinisterioName($cargoNome);

                // Initialize ministry if not exists
                if (! isset($ministerios[$ministerioNome])) {
                    $ministerios[$ministerioNome] = [
                        'nome' => $ministerioNome,
                        'cargos' => [],
                    ];
                }

                // Find if cargo already exists in this ministry
                $cargoExists = false;
                foreach ($ministerios[$ministerioNome]['cargos'] as &$existingCargo) {
                    if ($existingCargo['nome'] === $cargoNome) {
                        $cargoExists = true;

                        // Check if the current person is different from the last one
                        $lastCidadao = end($existingCargo['cidadaos']);
                        if ($lastCidadao['nome'] !== $cargoData['nome']) {
                            // Close the previous person's term
                            if (empty($lastCidadao['data_fim'])) {
                                $lastCidadao['data_fim'] = $date;
                            }

                            // Add the new person
                            $existingCargo['cidadaos'][] = [
                                'nome' => $cargoData['nome'],
                                'data_inicio' => $date,
                                'data_fim' => '',
                            ];
                        }

                        // Handle subcargos with the same logic
                        if (! empty($cargoData['subcargos'])) {
                            if (! isset($existingCargo['subcargos'])) {
                                $existingCargo['subcargos'] = [];
                            }

                            foreach ($cargoData['subcargos'] as $subcargoNome => $subcargoData) {
                                $subcargoExists = false;
                                foreach ($existingCargo['subcargos'] as &$existingSubcargo) {
                                    if ($existingSubcargo['nome'] === $subcargoNome) {
                                        $subcargoExists = true;
                                        $lastSubCidadao = end($existingSubcargo['cidadaos']);

                                        if ($lastSubCidadao['nome'] !== $subcargoData['nome']) {
                                            if (empty($lastSubCidadao['data_fim'])) {
                                                $lastSubCidadao['data_fim'] = $date;
                                            }

                                            $existingSubcargo['cidadaos'][] = [
                                                'nome' => $subcargoData['nome'],
                                                'data_inicio' => $date,
                                                'data_fim' => '',
                                            ];
                                        }

                                        break;
                                    }
                                }

                                if (! $subcargoExists) {
                                    $existingCargo['subcargos'][] = [
                                        'nome' => $subcargoNome,
                                        'cidadaos' => [[
                                            'nome' => $subcargoData['nome'],
                                            'data_inicio' => $date,
                                            'data_fim' => '',
                                        ]],
                                    ];
                                }
                            }
                        }

                        break;
                    }
                }

                // If cargo doesn't exist, create it
                if (! $cargoExists) {
                    $cargoEntry = [
                        'nome' => $cargoNome,
                        'cidadaos' => [[
                            'nome' => $cargoData['nome'],
                            'data_inicio' => $date,
                            'data_fim' => '',
                        ]],
                    ];

                    // Add subcargos if they exist
                    if (! empty($cargoData['subcargos'])) {
                        $cargoEntry['subcargos'] = [];
                        foreach ($cargoData['subcargos'] as $subcargoNome => $subcargoData) {
                            $cargoEntry['subcargos'][] = [
                                'nome' => $subcargoNome,
                                'cidadaos' => [[
                                    'nome' => $subcargoData['nome'],
                                    'data_inicio' => $date,
                                    'data_fim' => '',
                                ]],
                            ];
                        }
                    }

                    $ministerios[$ministerioNome]['cargos'][] = $cargoEntry;
                }
            }
        }

        // Convert ministerios associative array to indexed array
        $transformed = array_merge($transformed, array_values($ministerios));

        return $transformed;
    }

    private function getMinisterioName(string $cargoNome): string
    {
        // Special cases
        if (str_contains($cargoNome, 'Primeiro-Ministro')) {
            return 'Presidência do Conselho de Ministros';
        }

        // For regular ministers, extract ministry name from cargo
        if (str_contains($cargoNome, 'Ministro')) {
            // Remove "Ministro d" and similar prefixes
            $ministerioNome = preg_replace('/^Ministro d[aoe]s? /', 'Ministério $1', $cargoNome);

            return $ministerioNome;
        }

        // For secretaries and other positions, you might need additional logic
        // to determine which ministry they belong to
        return 'Ministério Sem Pasta'; // Default fallback
    }
}
