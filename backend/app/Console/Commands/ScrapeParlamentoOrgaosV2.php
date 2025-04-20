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

        // Get basic details from DetalheOrgao
        $detalhe = $data['DetalheOrgao'] ?? [];
        $cleaned = [
            'idOrgao' => $detalhe['idOrgao'] ?? null,
            'siglaOrgao' => $detalhe['siglaOrgao'] ?? null,
            'nomeSigla' => $detalhe['nomeSigla'] ?? null,
            'numeroOrgao' => $detalhe['numeroOrgao'] ?? null,
            'siglaLegislatura' => $detalhe['siglaLegislatura'] ?? null,
        ];

        // Handle Composicao if it exists
        if (isset($data['Composicao']['pt_ar_wsgode_objectos_DadosDeputadoSearch'])) {
            $cleaned['Composicao'] = array_map(function ($deputado): array {
                $cleanedDeputado = [
                    'depId' => $deputado['depId'] ?? null,
                    'depCadId' => $deputado['depCadId'] ?? null,
                    'depNomeParlamentar' => $deputado['depNomeParlamentar'] ?? null,
                    'depNomeCompleto' => $deputado['depNomeCompleto'] ?? null,
                    'depCPId' => $deputado['depCPId'] ?? null,
                    'depCPDes' => $deputado['depCPDes'] ?? null,
                    'legDes' => $deputado['legDes'] ?? null,
                ];

                // Clean GP (partido) data
                if (isset($deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP'])) {
                    $gp = $deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP'];
                    $cleanedDeputado['depGP'] = [
                        'gpId' => $gp['gpId'] ?? null,
                        'gpSigla' => $gp['gpSigla'] ?? null,
                        'gpDtInicio' => $gp['gpDtInicio'] ?? null,
                        'gpDtFim' => $gp['gpDtFim'] ?? null,
                    ];
                }

                // Clean Situacao data
                if (isset($deputado['depSituacao']['pt_ar_wsgode_objectos_DadosSituacaoDeputado'])) {
                    $situacoes = $deputado['depSituacao']['pt_ar_wsgode_objectos_DadosSituacaoDeputado'];
                    // Handle both single situation and array of situations
                    if (! isset($situacoes[0])) {
                        $situacoes = [$situacoes];
                    }

                    $cleanedDeputado['depSituacao'] = array_map(fn ($situacao): array => [
                        'sioDes' => $situacao['sioDes'] ?? null,
                        'sioDtInicio' => $situacao['sioDtInicio'] ?? null,
                        'sioDtFim' => $situacao['sioDtFim'] ?? null,
                    ], $situacoes);
                }

                return $cleanedDeputado;
            }, $data['Composicao']['pt_ar_wsgode_objectos_DadosDeputadoSearch']);
        }

        // Handle Reunioes if they exist
        if (isset($data['Reunioes']['ReuniaoPlenario'])) {
            $cleaned['Reunioes'] = array_map(fn (array $reuniao): array => [
                'reuId' => $reuniao['Reuniao']['reuId'] ?? null,
                'reuNumero' => $reuniao['Reuniao']['reuNumero'] ?? null,
                'reuDataHora' => $reuniao['Reuniao']['reuDataHora'] ?? null,
                'reuTirDes' => $reuniao['Reuniao']['reuTirDes'] ?? null,
                'legDes' => $reuniao['Reuniao']['legDes'] ?? null,
                'selNumero' => $reuniao['Reuniao']['selNumero'] ?? null,
                'Presencas' => [
                    'dtReuniao' => $reuniao['Presencas']['dtReuniao'] ?? null,
                    'tipoReuniao' => $reuniao['Presencas']['tipoReuniao'] ?? null,
                ],
            ], $data['Reunioes']['ReuniaoPlenario']);

            usort($cleaned['Reunioes'], fn ($a, $b): int => ($a['reuNumero'] ?? 0) <=> ($b['reuNumero'] ?? 0));
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
        if (! empty($gp)) {
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
        if (! empty($situacoes)) {
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

        if (! isset($data['Orgao'])) {
            $this->warn('No Orgao data found in Comissoes');

            return [];
        }

        $orgaos = $data['Orgao'];
        $this->line('Found '.count($orgaos).' Orgao entries in Comissoes');

        $grouping = array_map(function ($orgao): array {
            $detalhe = $orgao['DetalheOrgao'] ?? [];
            $cleaned = [
                'idOrgao' => $detalhe['idOrgao'] ?? null,
                'siglaOrgao' => $detalhe['siglaOrgao'] ?? null,
                'nomeSigla' => $detalhe['nomeSigla'] ?? null,
                'numeroOrgao' => $detalhe['numeroOrgao'] ?? null,
            ];

            // Handle Reunioes if they exist
            if (isset($orgao['Reunioes']['pt_ar_wsgode_objectos_DadosReuniao'])) {
                $cleaned['Reunioes'] = array_map(fn ($reuniao): array => [
                    'reuId' => $reuniao['reuId'] ?? null,
                    'reuNumero' => $reuniao['reuNumero'] ?? null,
                    'reuDataHora' => $reuniao['reuDataHora'] ?? null,
                    'reuFinalPlenario' => $reuniao['reuFinalPlenario'] ?? null,
                    'reuTirDes' => $reuniao['reuTirDes'] ?? null,
                    'reuTarId' => $reuniao['reuTarId'] ?? null,
                ], $orgao['Reunioes']['pt_ar_wsgode_objectos_DadosReuniao']);
            }

            return $cleaned;
        }, $orgaos);

        // Order by numeroOrgao ASC
        usort($grouping, fn ($a, $b): int => ($a['numeroOrgao'] ?? 0) <=> ($b['numeroOrgao'] ?? 0));

        return $grouping;
    }

    private function fetchData(): array
    {
        $this->info('Fetching data from API...');

        $response = Http::withoutVerifying()
            ->get(self::BASE_URL, [
                'path' => 'IQyC2USCCcoYqqGVBpgadlxwTGRXszv6nSXtSuXGjsHb0oHIlz0lPfgHVwg8S9vffJ%2b%2bmDexWLc4j%2fl0BXfpN%2falsCs8HGx4VNbPPWOoAzpeGcJe6VHTiNewqbRgx78Bvyc1AcE8AQh%2fHD3D7OuaLIIjOgx9QDdNxVsJGsLtyM7qIESbD%2fLJd67HrtYEgbIfdXrmCjkLn5eaFmjK3edQBOuV6pyYulX9IyKrfZNSynmElmF85q%2f0uSiuio0lAAlapeW%2f4abXplN4xFSsuKtN6IrCvHkk2u8WQ%2frNQ1PNSFy1sPME%2flqW0uIT568WvMym0W2eJyn6PnwmlWDRUe5PdZMqv7WvDs11NMW1uTUUSyALSBBWBRh8JcdavHqKbjjMGeSBhmnM3ASpZgdhClUWIA%3d%3d',
                'fich' => 'OrgaoComposicaoV_json.txt',
                'Inline' => 'true',
            ]);

        if (! $response->successful()) {
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

        // Handle Comissoes - both array and direct formats
        if (isset($data['Comissoes'])) {
            $comissoes = is_array($data['Comissoes']) ? $data['Comissoes'] : [$data['Comissoes']];
            $transformed['Comissoes'] = array_map([$this, 'cleanOrgao'], $comissoes);
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

        // Log the structure we found
        $this->line(sprintf('Found structure for %s: ', $type).json_encode(array_keys($data)));

        if (isset($data['Orgao'])) {
            $count = is_array($data['Orgao']) ? count($data['Orgao']) : 0;
            $this->line(sprintf('Found %d organs in %s', $count, $type));

            if ($count > 0) {
                $this->line('First organ structure: '.json_encode(array_keys($data['Orgao'][0])));
            }
        }

        // TODO: Implement specific transformation
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

        if (isset($data['Composicao'])) {
            $this->line('Has Composicao structure');
        }

        if (isset($data['Reunioes'])) {
            $this->line('Has Reunioes structure');
        }

        // TODO: Implement specific transformation
        return $data;
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
