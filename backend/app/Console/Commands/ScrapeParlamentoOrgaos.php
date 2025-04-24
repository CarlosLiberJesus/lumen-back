<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

final class ScrapeParlamentoOrgaosV2 extends Command
{
    private const BASE_URL = 'https://app.parlamento.pt/webutils/docs/doc.txt';

    protected $signature = 'scrape:parlamento-orgaos';

    protected $description = 'Scrape parliamentary bodies composition from parlamento.pt (v3)';

    public function handle(): int
    {
        $this->info('Starting parliamentary bodies composition scraping (V3)...');

        try {
            $data = $this->fetchData();

            $comissoes = $this->cleanComissao($data['Comissoes'] ?? []);

            $parlamento = $this->cleanParlamento($data['Plenario'] ?? []);
            // $this->line(json_encode($parlamento));

            $finalData = [
                [
                    'nome' => 'Comissões',
                    'lista' => [
                        [
                            'nome' => 'Comissão Eventual',
                            'lista' => $comissoes,
                        ],
                    ],
                ],
                $parlamento,
            ];
            $this->saveResults('orgaos_original.json', $data);
            $this->saveResults('orgaos_comissoes.json', $finalData);

            return Command::SUCCESS;
        } catch (Exception $exception) {
            $this->error('Error: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function cleanParlamento(array $orgao): array
    {
        $parlamento = [
            'nome' => 'Assembleia da República',
        ];
        $this->info('Processing Parlamento...');
        $this->line('Parlamento structure: '.json_encode(array_keys($orgao)));
        if ($orgao === []) {
            $this->warn('No Parlamento data found');

            return [];
        }

        if (isset($orgao['Composicao'])) {
            $this->line('First Composicao structure: '.json_encode(array_keys($orgao['Composicao'][0])));
            $parlamento['Composicao'] = $orgao['Composicao'];
        }

        if (isset($orgao['Reunioes'])) {
            $this->line('First Reuniao structure: '.json_encode(array_keys($orgao['Reunioes'][0])));
            $parlamento['Reunioes'] = $orgao['Reunioes'];
        }

        return $parlamento;
    }

    private function cleanComissao(array $orgao): array
    {
        $comissoes = [];
        if ($orgao === []) {
            $this->warn('No Comissao data found');

            return [];
        }

        foreach ($orgao as $comissaoData) {
            if (isset($comissaoData['DetalheOrgao'])) {
                $this->info('Processing '.$comissaoData['DetalheOrgao']['nomeSigla']);
                $comissoes[] = $comissaoData['DetalheOrgao'];
            }

            if (isset($comissaoData['Reunioes'])) {
                $this->info('Processing '.count($comissaoData['Reunioes']).' reunioes para '.$comissaoData['DetalheOrgao']['nomeSigla']);
                if (count($comissaoData['Reunioes']) > 0) {
                    $this->line('First Reuniao structure: '.json_encode(array_keys($comissaoData['Reunioes'][0])));
                    $comissoes[count($comissoes) - 1]['Reunioes'] = $comissaoData['Reunioes'];
                }
            }

        }

        return $comissoes;
    }

    private function fetchData(): array
    {
        $this->info('Fetching data from API...');

        $response = Http::withoutVerifying()
            ->get(self::BASE_URL, [
                'path' => 'yEIR3w4ocXRatF7cfDo3l3XEDrSUMVRCcyLEx6qFiKz1KDKKWhp5UsPJQl0z58UW95vZciGvaX8KBrGBBYYJV4EYNSym9CwhPtbQlHIsuhj8pXlId55feAgmkVji27ZLmHYXUY7rhV9eCyOptbADhY9Z69oKIXNqngkMK0khEu6uq212aZ%2fxWaMp5n1da5%2fh3znKpXU3jnKoziDRtn6cFbB5sHnxfO9PfkcE2SNyB0xCNHrb2f4RzWBBCyjPmW26eJjYZ1l1YoDuQwwRS8LEljKsqP7udxDz9vxvJH0JqXY64i%2fWsaz15BjMgOaW9rYGXO6RuFXS6vBI3Es9t7TmqCV2CpFatjAqHSLIvdf%2fbuGnQlNoeIGyhlzHK7LervBF',
                'fich' => 'OrgaoComposicaoV_json.txt',
                'Inline' => 'true',
            ]);

        if (!$response->successful()) {
            throw new Exception('Failed to fetch data: '.$response->status());
        }

        return $response->json();
    }

    private function saveResults(string $filename, array $transformed): void
    {
        $this->info('Saving processed data...');

        Storage::put(
            'parlamento/'.$filename,
            json_encode($transformed, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE)
        );

        $this->info('Data successfully saved');
    }
}
