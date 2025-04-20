<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

final class ScrapeParlamentoOrgaosBck extends Command
{
    private const BASE_URL = 'https://app.parlamento.pt/webutils/docs/doc.txt';

    protected $signature = 'scrape:parlamento-orgaos-bck';

    protected $description = 'Scrape parliamentary bodies composition from parlamento.pt';

    public function handle(): int
    {
        $this->info('Starting parliamentary bodies composition scraping...');

        try {
            // Disable SSL verification for development
            $response = Http::withoutVerifying()
                ->get(self::BASE_URL, [
                    'path' => 'Mps1bR6q1zYaPL0K1jhDAION%2fklgxQsBWC3xuWvd7U6YMaJsN8895fcCcmztu5ijFXF20LaZOKRd6bHUGeTZdhPqYb2tagyE03bsq%2bW2U7IAOHGxw1fyBSf0BwdsUMR5DsPIL4QqK2HRKBQcrKJQ5Efs86ya1oQ7BAFUdl%2f6LakAyYXfFGOuhYmwqJmgtfvo%2fRPfh%2bncy3E%2f2chjuQeYsIlF2tT6%2b79YWC1795%2bDrHDhQN4G1TwHAAcEn0vV7ShFpwUck%2bl%2bMBJ0nCihoJZpV7YgbnhcBNeUx9mh3VM9xIcz%2flvnvkImusmm89vqDAq8UOkWejB%2fsKkPxZHaYvZ53cGwxcCPpt7iCY0g8tKxBD5t5f4omRSfoY5qf%2buyH8PK1%2f6etmNKdunOQqSiUyZjWQ%3d%3d',
                    'fich' => 'OrgaoComposicaoII_json.txt',
                    'Inline' => 'true',
                ]);

            if (!$response->successful()) {
                throw new Exception('Failed to fetch data: '.$response->status());
            }

            $data = $response->json();

            // Debug raw data
            $this->info('Raw data structure:');
            $this->line(json_encode(array_keys($data), JSON_PRETTY_PRINT));

            // Get the actual data from inside OrganizacaoAR
            $orgData = $data['OrganizacaoAR'] ?? null;
            if (!$orgData) {
                throw new Exception('Missing OrganizacaoAR in response data');
            }

            // Debug OrganizacaoAR structure
            $this->info('OrganizacaoAR structure:');
            $this->line(json_encode(array_keys($orgData), JSON_PRETTY_PRINT));

            // Transform the data into a more useful structure
            $transformed = $this->transformData($orgData);

            // Debug transformed data
            $this->info('Transformed data structure:');
            $this->line(json_encode(array_keys($transformed), JSON_PRETTY_PRINT));

            // Debug specific sections
            if (isset($orgData['Plenario'])) {
                $this->info('Plenario details:');
                $this->line('Raw Plenario structure:');
                $this->line(json_encode($orgData['Plenario'], JSON_PRETTY_PRINT));

                $this->line('- Has DetalheOrgao: '.(isset($orgData['Plenario']['DetalheOrgao']) ? 'Yes' : 'No'));
                $this->line('- Has Composicao: '.(isset($orgData['Plenario']['Composicao']) ? 'Yes' : 'No'));

                if (isset($orgData['Plenario']['Composicao'])) {
                    $this->line('Composicao structure:');
                    $this->line(json_encode($orgData['Plenario']['Composicao'], JSON_PRETTY_PRINT));
                }

                if (isset($orgData['Plenario']['Composicao']['pt_ar_wsgode_objectos_DadosDeputadoSearch'])) {
                    $deputadosData = $orgData['Plenario']['Composicao']['pt_ar_wsgode_objectos_DadosDeputadoSearch'];
                    $this->line('DadosDeputadoSearch type: '.gettype($deputadosData));
                    $this->line('DadosDeputadoSearch structure:');
                    $this->line(json_encode($deputadosData, JSON_PRETTY_PRINT));
                }
            }

            if (isset($orgData['Comissoes'])) {
                $this->info('Comissoes details:');
                if (isset($orgData['Comissoes']['Orgao'])) {
                    $comissoesCount = count($orgData['Comissoes']['Orgao']);
                    $this->line('- Number of Comissoes: '.$comissoesCount);

                    // Show first commission as example
                    if ($comissoesCount > 0) {
                        $this->line('First Commission structure:');
                        $this->line(json_encode($orgData['Comissoes']['Orgao'][0], JSON_PRETTY_PRINT));
                    }
                }
            }

            // Save raw data for reference
            Storage::put(
                'parlamento/raw_orgaos.json',
                json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE)
            );

            // Save transformed data
            Storage::put(
                'parlamento/transformed_orgaos.json',
                json_encode($transformed, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE)
            );

            $this->info('Data successfully scraped and saved');

            return Command::SUCCESS;

        } catch (Exception $exception) {
            $this->error('Error: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function transformData(array $data): array
    {
        $transformed = [];

        foreach ($data as $orgaoName => $orgaoData) {
            // Skip XML attributes and empty data
            if (str_starts_with($orgaoName, '@')) {
                continue;
            }

            if (empty($orgaoData)) {
                continue;
            }

            // Convert string data to array to handle empty organs
            if (is_string($orgaoData)) {
                $orgaoData = [];
            }

            $transformed[$orgaoName] = [
                'nome' => $this->getNormalizedName($orgaoName),
                'detalhes' => $this->transformDetalheOrgao($orgaoData['DetalheOrgao'] ?? null),
            ];

            // Handle special case for Comissoes which has nested Orgao array
            if ($orgaoName === 'Comissoes' && isset($orgaoData['Orgao'])) {
                $transformed[$orgaoName]['orgaos'] = array_map(
                    fn ($orgao): array => [
                        'detalhes' => $this->transformDetalheOrgao($orgao['DetalheOrgao'] ?? null),
                        'composicao' => $this->getComposicao($orgao, 'Comissoes'),
                    ],
                    (array) $orgaoData['Orgao']
                );
            }

            // Handle special case for Plenario with detailed composition
            if ($orgaoName === 'Plenario' && isset($orgaoData['Composicao'])) {
                $transformed[$orgaoName]['composicao'] = $this->transformPlenarioComposicao(
                    $orgaoData['Composicao']['pt_ar_wsgode_objectos_DadosDeputadoSearch'] ?? []
                );
                $transformed[$orgaoName]['reunioes'] = $this->transformReunioes(
                    $orgaoData['Reunioes']['ReuniaoPlenario'] ?? []
                );
            } else {
                // Only try to get composition if orgaoData is an array
                $transformed[$orgaoName]['composicao'] = is_array($orgaoData)
                    ? $this->getComposicao($orgaoData, $orgaoName)
                    : null;
            }
        }

        return $transformed;
    }

    private function transformDetalheOrgao(?array $detalhe): ?array
    {
        if ($detalhe === null || $detalhe === []) {
            return null;
        }

        return [
            'id' => $detalhe['idOrgao'] ?? $detalhe['orgId'] ?? null,
            'sigla' => $detalhe['siglaOrgao'] ?? $detalhe['orgSigla'] ?? null,
            'nome' => $detalhe['nomeSigla'] ?? null,
            'numero' => $detalhe['numeroOrgao'] ?? $detalhe['orgNumero'] ?? null,
            'legislatura' => $detalhe['siglaLegislatura'] ?? $detalhe['legDes'] ?? null,
        ];
    }

    private function transformPlenarioComposicao(array $deputados): array
    {
        // Debug the input structure
        $this->info('Transforming Plenario Composicao:');
        $this->line('Number of deputados: '.count($deputados));
        $this->line('First deputado structure:');
        if ($deputados !== []) {
            $this->line(json_encode($deputados[0], JSON_PRETTY_PRINT));
        }

        return array_map(function ($deputado): array {
            // Debug each deputado's structure
            $this->line('Processing deputado:');
            $this->line(json_encode($deputado, JSON_PRETTY_PRINT));

            $situacoes = [];
            if (isset($deputado['depSituacao']['pt_ar_wsgode_objectos_DadosSituacaoDeputado'])) {
                $situacaoData = $deputado['depSituacao']['pt_ar_wsgode_objectos_DadosSituacaoDeputado'];

                // Debug situacao structure
                $this->line('Situacao structure:');
                $this->line(json_encode($situacaoData, JSON_PRETTY_PRINT));

                // Handle both single and multiple situations
                if (isset($situacaoData['sioDes'])) {
                    // Single situation
                    $situacoes[] = [
                        'tipo' => $situacaoData['sioDes'],
                        'data_inicio' => $situacaoData['sioDtInicio'],
                        'data_fim' => $situacaoData['sioDtFim'],
                    ];
                } else {
                    // Multiple situations
                    $situacoes = array_map(fn ($situacao): array => [
                        'tipo' => $situacao['sioDes'],
                        'data_inicio' => $situacao['sioDtInicio'],
                        'data_fim' => $situacao['sioDtFim'],
                    ], $situacaoData);
                }
            }

            return [
                'id' => $deputado['depId'],
                'nome_parlamentar' => $deputado['depNomeParlamentar'],
                'nome_completo' => $deputado['depNomeCompleto'],
                'circulo' => [
                    'id' => $deputado['depCPId'],
                    'nome' => $deputado['depCPDes'],
                ],
                'grupo_parlamentar' => isset($deputado['depGP']) ? [
                    'id' => $deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP']['gpId'],
                    'sigla' => $deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP']['gpSigla'],
                    'data_inicio' => $deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP']['gpDtInicio'],
                    'data_fim' => $deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP']['gpDtFim'],
                ] : null,
                'situacoes' => $situacoes,
            ];
        }, $deputados);
    }

    private function transformReunioes(array $reunioes): array
    {
        return array_map(function (array $reuniao): array {
            $dados = $reuniao['Reuniao'];

            return [
                'id' => $dados['reuId'],
                'numero' => $dados['reuNumero'],
                'data_hora' => $dados['reuDataHora'],
                'tipo' => $dados['reuTirDes'],
                'legislatura' => $dados['legDes'],
                'sessao_numero' => $dados['selNumero'],
                'presencas' => [
                    'data' => $reuniao['Presencas']['dtReuniao'],
                    'tipo' => $reuniao['Presencas']['tipoReuniao'],
                ],
            ];
        }, $reunioes);
    }

    private function getNormalizedName(string $key): string
    {
        $names = [
            'ComissaoPermanente' => 'Comissão Permanente',
            'Comissoes' => 'Comissões',
            'ConferenciaLideres' => 'Conferência de Líderes',
            'ConferenciaPresidentesComissoes' => 'Conferência dos Presidentes das Comissões',
            'ConselhoAdministracao' => 'Conselho de Administração',
            'GruposTrabalho' => 'Grupos de Trabalho',
            'MesaAR' => 'Mesa da Assembleia da República',
            'Plenario' => 'Plenário',
            'SubComissoes' => 'Subcomissões',
        ];

        return $names[$key] ?? $key;
    }

    private function getComposicao(array $orgaoData, string $orgaoName): ?array
    {
        // Handle different composition field names based on organ type
        $composicaoFields = [
            'MesaAR' => 'HistoricoComposicaoMesa',
            'ConferenciaPresidentesComissoes' => 'HistoricoComposicaoCPC',
            'default' => 'HistoricoComposicao',
        ];

        $field = $composicaoFields[$orgaoName] ?? $composicaoFields['default'];

        // If the field doesn't exist or is a string (empty in XML), return null
        if (!isset($orgaoData[$field]) || is_string($orgaoData[$field])) {
            return null;
        }

        return $orgaoData[$field];
    }
}
