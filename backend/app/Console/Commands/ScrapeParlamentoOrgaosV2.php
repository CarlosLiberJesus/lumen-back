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

    protected $signature = 'scrape:parlamento-orgaos-v2';

    protected $description = 'Scrape parliamentary bodies composition from parlamento.pt (v2)';

    public function handle(): int
    {
        $this->info('Starting parliamentary bodies composition scraping (V2)...');

        try {
            $data = $this->fetchData();
            $orgData = $this->validateAndExtractOrganizacaoAR($data);

            $transformed = [
                'ConselhoAdministracao' => $this->processConselhoAdministracao($orgData['ConselhoAdministracao'] ?? null),
                'ConferenciaLideres' => $this->processConferenciaLideres($orgData['ConferenciaLideres'] ?? null),
                'ConferenciaPresidentesComissoes' => $this->processConferenciaPresidentesComissoes($orgData['ConferenciaPresidentesComissoes'] ?? null),
                'ComissaoPermanente' => $this->processComissaoPermanente($orgData['ComissaoPermanente'] ?? null),
                'MesaAR' => $this->processMesaAR($orgData['MesaAR'] ?? null),
                'Comissoes' => $this->processArrayOfOrgao($orgData['Comissoes'] ?? null, 'Comissoes'),
                'SubComissoes' => $this->processArrayOfOrgao($orgData['SubComissoes'] ?? null, 'SubComissoes'),
                'GruposTrabalho' => $this->processArrayOfOrgao($orgData['GruposTrabalho'] ?? null, 'GruposTrabalho'),
                'GruposTrabalhoAR' => $this->processArrayOfOrgao($orgData['GruposTrabalhoAR'] ?? null, 'GruposTrabalhoAR'),
                'Plenario' => $this->processOrgaoPlenario($orgData['Plenario'] ?? null),
            ];

            $this->saveResults('orgaos_loaded.json', $transformed);

            $cleaned = [
                'ConselhoAdministracao' => $transformed['ConselhoAdministracao'],
                'ConferenciaLideres' => $transformed['ConferenciaLideres'],
                'ConferenciaPresidentesComissoes' => $transformed['ConferenciaPresidentesComissoes'],
                'ComissaoPermanente' => $transformed['ComissaoPermanente'],
                'MesaAR' => $transformed['MesaAR'],
                'Comissoes' => $this->cleanComissoes($transformed['Comissoes']),
                'SubComissoes' => $transformed['SubComissoes'],
                'GruposTrabalho' => $transformed['GruposTrabalho'],
                'GruposTrabalhoAR' => $transformed['GruposTrabalhoAR'],
                'Plenario' => $this->cleanPlenario($transformed['Plenario']),
            ];

            $this->saveResults('orgaos_final.json', $cleaned);

            return Command::SUCCESS;
        } catch (Exception $exception) {
            $this->error('Error: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function cleanPlenario(array $data): array
    {
        $this->info('Cleaning Plenario...');
        $cleaned = [];

        // Handle DetalheOrgao if present
        if (isset($data['DetalheOrgao'])) {
            $cleaned['DetalheOrgao'] = $data['DetalheOrgao'];
        }

        // Handle Composicao format
        if (isset($data['Composicao'])) {
            $this->info('Processing Plenario Composicao...');

            $cleaned['Composicao'] = array_map(function ($deputado): array {
                $cleanedDeputado = [
                    'depId' => $deputado['depId'] ?? null,
                    'depCadId' => $deputado['depCadId'] ?? null,
                    'depNomeParlamentar' => $deputado['depNomeParlamentar'] ?? null,
                    'depNomeCompleto' => $deputado['depNomeCompleto'] ?? null,
                    'depCPId' => $deputado['depCPId'] ?? null,
                    'depCPDes' => $deputado['depCPDes'] ?? null,
                    'legDes' => $deputado['legDes'] ?? null,
                    'videos' => $deputado['videos'] ?? null,
                ];

                if (!empty($deputado['depGP'])) {
                    $cleanedDeputado['depGP'] = $deputado['depGP'];
                }

                if (!empty($deputado['depSituacao'])) {
                    $cleanedDeputado['depSituacao'] = $deputado['depSituacao'];
                }

                return $cleanedDeputado;
            }, $data['Composicao']);
        }

        // Handle Reunioes
        if (isset($data['Reunioes'])) {
            $this->info('Processing Plenario Reunioes...');
            // $this->line(json_encode($data['Reunioes']));
            $cleaned['Reunioes'] = array_map(function (array $reuniao): array {
                // Debug each reuniao being processed
                $this->line('Processing reuniao:');
                // $this->line(json_encode($reuniao, JSON_PRETTY_PRINT));

                $cleanedReuniao = [
                    'Reuniao' => [
                        'reuId' => $reuniao['Reuniao']['reuId'] ?? null,
                        'reuNumero' => $reuniao['Reuniao']['reuNumero'] ?? null,
                        'reuDataHora' => $reuniao['Reuniao']['reuDataHora'] ?? null,
                        'reuTirDes' => $reuniao['Reuniao']['reuTirDes'] ?? null,
                        'legDes' => $reuniao['Reuniao']['legDes'] ?? null,
                        'selNumero' => $reuniao['Reuniao']['selNumero'] ?? null,
                        'reuActa' => $reuniao['Reuniao']['reuActa'] ?? null,
                        'reuLink' => $reuniao['Reuniao']['reuLink'] ?? null,
                        'reuLocal' => $reuniao['Reuniao']['reuLocal'] ?? null,
                    ],
                    'Presencas' => [
                        'dtReuniao' => $reuniao['Presencas']['dtReuniao'] ?? null,
                        'tipoReuniao' => $reuniao['Presencas']['tipoReuniao'] ?? null,
                        'presencas' => $reuniao['Presencas']['presencas'] ?? null,
                    ],
                ];

                // Debug cleaned output
                $this->line('Cleaned reuniao:');
                // $this->line(json_encode($cleanedReuniao, JSON_PRETTY_PRINT));

                return $cleanedReuniao;
            }, $data['Reunioes']);
        }

        return $cleaned;
    }

    private function cleanDeputado(array $deputado): array
    {
        $cleanedDeputado = [
            'depId' => $deputado['DepId'] ?? $deputado['depId'] ?? null,
            'depCadId' => $deputado['DepCadId'] ?? $deputado['depCadId'] ?? null,
            'depNomeParlamentar' => $deputado['DepNomeParlamentar'] ?? $deputado['depNomeParlamentar'] ?? null,
            'depNomeCompleto' => $deputado['DepNomeCompleto'] ?? $deputado['depNomeCompleto'] ?? null,
            'depCPId' => $deputado['DepCPId'] ?? $deputado['depCPId'] ?? null,
            'depCPDes' => $deputado['DepCPDes'] ?? $deputado['depCPDes'] ?? null,
            'legDes' => $deputado['LegDes'] ?? $deputado['legDes'] ?? null,
            'videos' => $deputado['Videos'] ?? null, // New field from Leg V onwards
        ];

        // Handle GP (partido) data - both array and single object formats
        $gp = $deputado['DepGP'] ?? $deputado['depGP'] ?? [];
        if (!empty($gp)) {
            // Convert to array if single object
            $gpArray = isset($gp[0]) ? $gp : [$gp];
            $cleanedDeputado['depGP'] = array_map(fn ($partido): array => [
                'gpId' => $partido['gpId'] ?? null,
                'gpSigla' => $partido['gpSigla'] ?? null,
                'gpDtInicio' => $partido['gpDtInicio'] ?? null,
                'gpDtFim' => $partido['gpDtFim'] ?? null,
            ], $gpArray);
        }

        // Handle Situacao data - both array and single object formats
        $situacoes = $deputado['DepSituacao'] ?? $deputado['depSituacao'] ?? [];
        if (!empty($situacoes)) {
            // Convert to array if single object
            $situacoesArray = isset($situacoes[0]) ? $situacoes : [$situacoes];
            $cleanedDeputado['depSituacao'] = array_map(fn ($situacao): array => [
                'sioDes' => $situacao['sioDes'] ?? null,
                'sioDtInicio' => $situacao['sioDtInicio'] ?? null,
                'sioDtFim' => $situacao['sioDtFim'] ?? null,
            ], $situacoesArray);
        }

        return $cleanedDeputado;
    }

    private function cleanComissoes(array $data): array
    {
        $this->info('Cleaning Comissoes...');

        // New format: data is directly an array of organs
        if ($data === []) {
            $this->warn('No Comissoes data found');

            return [];
        }

        $this->line('Found '.count($data).' Orgao entries in Comissoes');

        $grouping = array_map(function ($orgao): array {
            $detalhe = $orgao['DetalheOrgao'] ?? [];
            $cleaned = [
                'idOrgao' => $detalhe['idOrgao'] ?? null,
                'siglaOrgao' => $detalhe['siglaOrgao'] ?? null,
                'nomeSigla' => $detalhe['nomeSigla'] ?? null,
                'numeroOrgao' => $detalhe['numeroOrgao'] ?? null,
            ];

            // Handle Reunioes if they exist
            if (!empty($orgao['Reunioes'])) {
                $cleaned['Reunioes'] = array_map(fn ($reuniao): array => [
                    'reuId' => $reuniao['reuId'] ?? null,
                    'reuNumero' => $reuniao['reuNumero'] ?? null,
                    'reuDataHora' => $reuniao['reuDataHora'] ?? null,
                    'reuFinalPlenario' => $reuniao['reuFinalPlenario'] ?? null,
                    'reuTirDes' => $reuniao['reuTirDes'] ?? null,
                    'reuTarId' => $reuniao['reuTarId'] ?? null,
                    'reuTarDes' => $reuniao['reuTarDes'] ?? null,
                    'reuTarSigla' => $reuniao['reuTarSigla'] ?? null,
                    'reuActa' => $reuniao['reuActa'] ?? null,
                    'reuLink' => $reuniao['reuLink'] ?? null,
                    'reuLocal' => $reuniao['reuLocal'] ?? null,
                ], $orgao['Reunioes']);
            }

            return $cleaned;
        }, $data);

        // Order by numeroOrgao ASC
        usort($grouping, fn ($a, $b): int => ($a['numeroOrgao'] ?? 0) <=> ($b['numeroOrgao'] ?? 0));

        return $grouping;
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

    private function validateAndExtractOrganizacaoAR(array $data): array
    {
        /*
        $this->info('Validating OrganizacaoAR structure...');

        if (!isset($data['OrganizacaoAR'])) {
            throw new \Exception('Missing OrganizacaoAR in response data');
        }

        return $data['OrganizacaoAR'];
        */
        // Remove XML artifacts if they exist
        if (isset($data['?xml'])) {
            $data = $data['OrganizacaoAR'] ?? [];
        }

        $transformed = [];

        // Handle ComissaoPermanente
        if (isset($data['ComissaoPermanente'])) {
            $transformed['ComissaoPermanente'] = $this->cleanOrgao($data['ComissaoPermanente']);
        }

        // Handle Comissoes - now it's a direct array
        if (isset($data['Comissoes'])) {
            $transformed['Comissoes'] = $this->processArrayOfOrgao($data['Comissoes'], 'Comissoes');
        }

        // Handle standard organs
        $standardOrgans = [
            'ConferenciaLideres',
            'ConferenciaPresidentesComissoes',
            'ConselhoAdministracao',
            'MesaAR',
            'Plenario',
        ];

        foreach ($standardOrgans as $organ) {
            if (isset($data[$organ])) {
                $transformed[$organ] = $this->cleanOrgao($data[$organ]);
            }
        }

        return $transformed;
    }

    private function cleanOrgao(array $orgao): array
    {
        $cleaned = [];

        // Handle DetalheOrgao
        if (isset($orgao['DetalheOrgao'])) {
            $detalhe = $orgao['DetalheOrgao'];
            $cleaned['DetalheOrgao'] = [
                'idOrgao' => $detalhe['idOrgao'] ?? null,
                'siglaOrgao' => $detalhe['siglaOrgao'] ?? null,
                'nomeSigla' => $detalhe['nomeSigla'] ?? null,
                'numeroOrgao' => $detalhe['numeroOrgao'] ?? null,
                'siglaLegislatura' => $detalhe['siglaLegislatura'] ?? null,
            ];
        }

        // Handle Reunioes - both formats
        if (isset($orgao['Reunioes'])) {
            $reunioes = $orgao['Reunioes'];
            if (is_array($reunioes)) {
                // New format (direct array)
                $cleaned['Reunioes'] = array_map(fn ($reuniao): array => [
                    'reuId' => $reuniao['reuId'] ?? null,
                    'reuNumero' => $reuniao['reuNumero'] ?? null,
                    'reuDataHora' => $reuniao['reuDataHora'] ?? null,
                    'reuTirDes' => $reuniao['reuTirDes'] ?? null,
                    'reuFinalPlenario' => $reuniao['reuFinalPlenario'] ?? null,
                    'reuTarDes' => $reuniao['reuTarDes'] ?? null,
                    'reuTarId' => $reuniao['reuTarId'] ?? null,
                    'reuTarSigla' => $reuniao['reuTarSigla'] ?? null,
                ], $reunioes);
            }
        }

        // Handle Composicao if exists (mainly for Plenario)
        if (isset($orgao['Composicao'])) {
            $cleaned['Composicao'] = array_map(
                [$this, 'cleanDeputado'],
                $orgao['Composicao']
            );
        }

        return $cleaned;
    }

    private function processConselhoAdministracao(?array $data): ?array
    {
        $this->info('Processing ConselhoAdministracao...');
        if ($data === null || $data === []) {
            $this->warn('No ConselhoAdministracao data found');

            return null;
        }

        // Log the structure we found
        $this->line('Found structure: '.json_encode(array_keys($data)));

        // TODO: Implement specific transformation
        return $data;
    }

    private function processConferenciaLideres(?array $data): ?array
    {
        $this->info('Processing ConferenciaLideres...');
        if ($data === null || $data === []) {
            $this->warn('No ConferenciaLideres data found');

            return null;
        }

        // Log the structure we found
        $this->line('Found structure: '.json_encode(array_keys($data)));

        // TODO: Implement specific transformation
        return $data;
    }

    private function processConferenciaPresidentesComissoes(?array $data): ?array
    {
        $this->info('Processing ConferenciaPresidentesComissoes...');
        if ($data === null || $data === []) {
            $this->warn('No ConferenciaPresidentesComissoes data found');

            return null;
        }

        // Log the structure we found
        $this->line('Found structure: '.json_encode(array_keys($data)));

        // TODO: Implement specific transformation
        return $data;
    }

    private function processComissaoPermanente(?array $data): ?array
    {
        $this->info('Processing ComissaoPermanente...');
        if ($data === null || $data === []) {
            $this->warn('No ComissaoPermanente data found');

            return null;
        }

        // Log the structure we found
        $this->line('Found structure: '.json_encode(array_keys($data)));

        // TODO: Implement specific transformation
        return $data;
    }

    private function processMesaAR(?array $data): ?array
    {
        $this->info('Processing MesaAR...');
        if ($data === null || $data === []) {
            $this->warn('No MesaAR data found');

            return null;
        }

        // Log the structure we found
        $this->line('Found structure: '.json_encode(array_keys($data)));

        // TODO: Implement specific transformation
        return $data;
    }

    private function processArrayOfOrgao(?array $data, string $type): ?array
    {
        $this->info(sprintf('Processing %s...', $type));
        if ($data === null || $data === []) {
            $this->warn(sprintf('No %s data found', $type));

            return null;
        }

        // For Comissoes, the data is already an array of organs
        if ($type === 'Comissoes') {
            $organs = $data;
            $count = count($organs);
            $this->line(sprintf('Found %d organs in %s', $count, $type));

            if ($count > 0) {
                $this->line('First organ structure: '.json_encode(array_keys($organs[0])));
            }

            return array_map(fn ($organ): array => [
                'DetalheOrgao' => [
                    'idOrgao' => $organ['DetalheOrgao']['idOrgao'] ?? null,
                    'siglaOrgao' => $organ['DetalheOrgao']['siglaOrgao'] ?? null,
                    'nomeSigla' => $organ['DetalheOrgao']['nomeSigla'] ?? null,
                    'numeroOrgao' => $organ['DetalheOrgao']['numeroOrgao'] ?? null,
                    'siglaLegislatura' => $organ['DetalheOrgao']['siglaLegislatura'] ?? null,
                ],
                'Reunioes' => isset($organ['Reunioes']) ? array_map(fn ($reuniao): array => [
                    'reuId' => $reuniao['reuId'] ?? null,
                    'reuNumero' => $reuniao['reuNumero'] ?? null,
                    'reuDataHora' => $reuniao['reuDataHora'] ?? null,
                    'reuTirDes' => $reuniao['reuTirDes'] ?? null,
                    'reuFinalPlenario' => $reuniao['reuFinalPlenario'] ?? null,
                    'reuTarDes' => $reuniao['reuTarDes'] ?? null,
                    'reuTarId' => $reuniao['reuTarId'] ?? null,
                    'reuTarSigla' => $reuniao['reuTarSigla'] ?? null,
                    'reuActa' => $reuniao['reuActa'] ?? null,
                    'reuLink' => $reuniao['reuLink'] ?? null,
                    'reuLocal' => $reuniao['reuLocal'] ?? null,
                ], $organ['Reunioes']) : [],
                'HistoricoComposicao' => $organ['HistoricoComposicao'] ?? null,
            ], $organs);

        }

        // Original code for other types that still use the old format
        if (isset($data['Orgao'])) {
            $count = is_array($data['Orgao']) ? count($data['Orgao']) : 0;
            $this->line(sprintf('Found %d organs in %s', $count, $type));

            if ($count > 0) {
                $this->line('First organ structure: '.json_encode(array_keys($data['Orgao'][0])));
            }
        }

        return $data;
    }

    private function processOrgaoPlenario(?array $data): ?array
    {
        $this->info('Processing Plenario...');
        if ($data === null || $data === []) {
            $this->warn('No Plenario data found');

            return null;
        }

        // Log the structure we found
        $this->line('Found structure: '.json_encode(array_keys($data)));

        $cleaned = [];

        if (isset($data['Composicao'])) {
            $this->line('Has Composicao structure');
            $cleaned['Composicao'] = $data['Composicao'];
        }

        if (isset($data['Reunioes'])) {
            $this->line('Has Reunioes structure');
            $this->line('Reunioes raw data: '.json_encode($data['Reunioes'], JSON_PRETTY_PRINT));

            // Transform Reunioes into the correct structure
            $cleaned['Reunioes'] = array_map(fn ($reuniao): array => [
                'Reuniao' => [
                    'reuId' => $reuniao['reuId'] ?? null,
                    'reuNumero' => $reuniao['reuNumero'] ?? null,
                    'reuDataHora' => $reuniao['reuDataHora'] ?? null,
                    'reuTirDes' => $reuniao['reuTirDes'] ?? null,
                    'legDes' => $reuniao['legDes'] ?? null,
                    'selNumero' => $reuniao['selNumero'] ?? null,
                    'reuActa' => $reuniao['reuActa'] ?? null,
                    'reuLink' => $reuniao['reuLink'] ?? null,
                    'reuLocal' => $reuniao['reuLocal'] ?? null,
                ],
                'Presencas' => [
                    'dtReuniao' => $reuniao['dtReuniao'] ?? null,
                    'tipoReuniao' => $reuniao['tipoReuniao'] ?? null,
                    'presencas' => $reuniao['presencas'] ?? null,
                ],
            ], $data['Reunioes']);
        }

        return $cleaned;
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
