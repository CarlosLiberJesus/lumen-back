<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

final class ScrapeParlamentoOrgaosDeprecated extends Command
{
    private const BASE_URL = 'https://app.parlamento.pt/webutils/docs/doc.txt';

    protected $signature = 'scrape:parlamento-orgaos-optimized';

    protected $description = 'Scrape and optimize Parlamento organs data (Phase 2)';

    public function handle(): int
    {
        try {
            // Use the same URL and parameters as the original command
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
            if (!isset($data['OrganizacaoAR'])) {
                throw new Exception('Missing OrganizacaoAR in response data');
            }

            $orgData = $data['OrganizacaoAR'];

            // Transform data with optimizations
            $transformed = $this->transformDataOptimized($orgData);

            // Save optimized version
            Storage::put(
                'parlamento/transformed_orgaos_v2.json',
                json_encode($transformed, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE)
            );

            $this->info('Data successfully scraped and optimized');

            return Command::SUCCESS;

        } catch (Exception $exception) {
            $this->error('Error: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function transformDataOptimized(array $data): array
    {
        $transformed = [];

        // Add metadata section for legislature info
        $transformed['metadata'] = [
            'legislatura' => 'II', // This will be parameterized in future versions
            'data_extracao' => now()->toISOString(),
        ];

        // Handle Comissoes directly as a list
        if (isset($data['Comissoes']['Orgao'])) {
            $transformed['comissoes'] = array_map(function ($orgao): array {
                $detalhe = $orgao['DetalheOrgao'] ?? [];

                return [
                    'id' => $detalhe['idOrgao'] ?? $detalhe['orgId'] ?? null,
                    'sigla' => $detalhe['siglaOrgao'] ?? $detalhe['orgSigla'] ?? null,
                    'nome' => $detalhe['nomeOrgao'] ?? $detalhe['orgNome'] ?? null,
                    'numero' => (int) ($detalhe['numeroOrgao'] ?? $detalhe['orgNumero'] ?? 0),
                ];
            }, (array) $data['Comissoes']['Orgao']);

            // Sort by numero
            usort($transformed['comissoes'], fn ($a, $b): int => $a['numero'] <=> $b['numero']);
        }

        // Optimize Plenario
        if (isset($data['Plenario'])) {
            $transformed['plenario'] = [
                'deputados' => $this->transformDeputadosOptimized($data['Plenario']['Composicao']['pt_ar_wsgode_objectos_DadosDeputadoSearch'] ?? []),
                'reunioes' => $this->transformReunioesOptimized($data['Plenario']['Reunioes']['ReuniaoPlenario'] ?? []),
            ];
        }

        return $transformed;
    }

    private function transformDeputadosOptimized(array $deputados): array
    {
        return array_map(function (array $deputado): array {
            // Get situacoes safely
            $situacoes = [];
            if (isset($deputado['depSituacao']['pt_ar_wsgode_objectos_DadosSituacaoDeputado'])) {
                $situacoesData = $deputado['depSituacao']['pt_ar_wsgode_objectos_DadosSituacaoDeputado'];
                // Handle both single situation and array of situations
                if (isset($situacoesData['sioDes'])) {
                    // Single situation
                    $situacoes[] = [
                        'tipo' => $situacoesData['sioDes'],
                        'data_inicio' => $situacoesData['sioDtInicio'] ?? null,
                        'data_fim' => $situacoesData['sioDtFim'] ?? null,
                    ];
                } else {
                    // Array of situations
                    foreach ((array) $situacoesData as $situacao) {
                        $situacoes[] = [
                            'tipo' => $situacao['sioDes'] ?? null,
                            'data_inicio' => $situacao['sioDtInicio'] ?? null,
                            'data_fim' => $situacao['sioDtFim'] ?? null,
                        ];
                    }
                }
            }

            // Get partido safely
            $partido = null;
            if (isset($deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP']['gpSigla'])) {
                $partido = $deputado['depGP']['pt_ar_wsgode_objectos_DadosSituacaoGP']['gpSigla'];
            }

            return [
                'id' => $deputado['depId'],
                'nome_parlamentar' => $deputado['depNomeParlamentar'],
                'nome_completo' => $deputado['depNomeCompleto'],
                'circulo' => $deputado['depCPDes'],
                'partido' => $partido,
                'situacoes' => $situacoes,
            ];
        }, $deputados);
    }

    private function transformReunioesOptimized(array $reunioes): array
    {
        $transformed = array_map(function (array $reuniao): array {
            $dados = $reuniao['Reuniao'];

            return [
                'id' => $dados['reuId'],
                'numero' => (int) $dados['reuNumero'],
                'data_hora' => $dados['reuDataHora'],
                'tipo' => $dados['reuTirDes'],
                'sessao_numero' => (int) $dados['selNumero'],
            ];
        }, $reunioes);

        // Sort by numero
        usort($transformed, fn ($a, $b): int => $b['numero'] <=> $a['numero']);

        return $transformed;
    }

    private function analyzeDataStructure(array $data): void
    {
        $this->info('Data Structure Analysis:');

        // Track non-null fields
        foreach ($data as $orgaoName => $orgaoData) {
            if (is_array($orgaoData)) {
                $nonNullFields = array_filter($orgaoData, fn ($v): bool => !is_null($v));
                $this->line($orgaoName.' has '.count($nonNullFields).' non-null fields:');
                $this->line(json_encode(array_keys($nonNullFields), JSON_PRETTY_PRINT));
            }
        }

        // Track unique values
        if (isset($data['Comissoes']['Orgao'])) {
            $siglas = array_unique(array_map(fn ($o) => $o['DetalheOrgao']['orgSigla'], $data['Comissoes']['Orgao']));
            $this->line('Unique commission siglas: '.implode(', ', $siglas));
        }

        // Could add more analysis as needed
    }
}
