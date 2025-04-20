<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Seeder;

final class ParlamentoOrgaosVSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        QueryLogger::enable();

        $this->command->info('Starting ParlamentoOrgaosV seeding');

        try {
            // First check if Legislatura exists
            $legislatura = Legislatura::where('sigla', 'V')
                ->where('nome', 'Assembleia da República')
                ->first();

            // If not exists, throw an exception
            if (! $legislatura) {
                throw new Exception('Legislatura not found. Please run the LegislaturaSeeder first.');
            }

            $this->command->info('Using Legislatura: '.$legislatura->sigla.' - '.$legislatura->nome);

            // Get or create Parlamento
            $parlamento = Instituicao::where('nome', 'Parlamento')->first();

            if (! $parlamento) {
                throw new Exception('Failed to create or find Parlamento institution.');
            }

            $orgaos = [
                [
                    'nome' => 'Comissões',
                    'lista' => [
                        [
                            'nome' => 'Comissão Eventual',
                            'lista' => [],
                        ],
                    ],
                ],
                [
                    'nome' => 'Assembleia da República',

                ],
            ];

            foreach ($orgaos as $orgao) {

                $instituicao = Instituicao::where('nome', $orgao['nome'])->where('responde_instituicao_id', $parlamento->id)->first();
                if (! $instituicao) {
                    $this->command->error('Instituicao '.$orgao['nome'].' not found.');

                    return;
                }

                $instituicaoLegislatura = InstituicaoLegislatura::create([
                    'uuid' => Str::uuid(),
                    'instituicao_id' => $instituicao->id,
                    'legislatura_id' => $legislatura->id,
                ]);
                // $this->command->info('Created instituicao_legislatura for: '. $instituicao->nome . ' - ' . $legislatura->sigla);

                if ($orgao['nome'] === 'Assembleia da República') {
                    $this->command->info('Processing Assembleia da República');

                    if (! isset($orgao['Composicao'])) {
                        $this->command->error('Composicao not found for '.$orgao['nome']);

                        return;
                    }
                    $this->command->info('Processing deputados...');
                    foreach ($orgao['Composicao'] as $deputadoData) {
                        // $this->command->info('Processing deputado: ' . $deputadoData['depNomeParlamentar']);

                        $nome = title_pt($deputadoData['depNomeParlamentar']);
                        $nome_completo = title_pt($deputadoData['depNomeCompleto']);

                        // First, try to find ALL existing citizens with this name
                        $existingCidadaos = Cidadao::where('nome', $nome)->get();

                        if ($existingCidadaos->isEmpty()) {
                            // Case 1: No existing citizen with this name - create new
                            $cidadao = Cidadao::create([
                                'uuid' => Str::uuid(),
                                'nome' => $nome,
                                'nome_completo' => $nome_completo,
                            ]);
                        } else {
                            $foundMatch = false;

                            // Check if we have an exact match (including nome_completo)
                            foreach ($existingCidadaos as $existing) {
                                if ($nome_completo && $existing->nome_completo === $nome_completo) {
                                    $cidadao = $existing;
                                    $foundMatch = true;
                                    break;
                                }
                            }

                            if (! $foundMatch) {
                                // Look for a record without nome_completo that we can update
                                $existingWithoutNomeCompleto = $existingCidadaos->first(function ($existing) {
                                    return $existing->nome_completo === null;
                                });

                                if ($existingWithoutNomeCompleto && $nome_completo) {
                                    $existingWithoutNomeCompleto->nome_completo = $nome_completo;
                                    $existingWithoutNomeCompleto->save();
                                    $cidadao = $existingWithoutNomeCompleto;
                                } else {
                                    // Create new if no match and no updateable record found
                                    if ($existingCidadaos[0]->nome === $nome) {
                                        $cidadao = $existingCidadaos[0];
                                    } else {
                                        // Create new if no match and no updateable record found
                                        $cidadao = Cidadao::create([
                                            'uuid' => Str::uuid(),
                                            'nome' => $nome,
                                            'nome_completo' => $nome_completo,
                                        ]);
                                    }
                                }
                            }
                        }

                        $instituicaoCargo = InstituicaoCargo::firstOrCreate([
                            'tipo' => 'instituicao_legislatura',
                            'cargo' => 'Deputado',
                            'instituicao_id' => $instituicaoLegislatura->id,
                        ],
                            [
                                'uuid' => Str::uuid(),
                            ]);

                        $data_inicio = $deputadoData['depSituacao'][0]['sioDtInicio'];
                        $data_fim = $deputadoData['depSituacao'][count($deputadoData['depSituacao']) - 1]['sioDtFim'];

                        if (! $data_inicio || ! $data_fim) {
                            $this->command->error('Datas bad for '.$deputadoData['depNomeParlamentar']);

                            return;
                        }

                        $cidadaoCargo = CidadaoCargo::create([
                            'cidadao_id' => $cidadao->id,
                            'cargo_id' => $instituicaoCargo->id,
                            'inicio' => $data_inicio,
                            'fim' => $data_fim,
                        ]);

                        $partido = Instituicao::where('sigla', 'LIKE', '%'.$deputadoData['depGP']['gpSigla'].'%')->first();
                        if (! $partido) {
                            $this->command->error('Partido not found for '.$deputadoData['depGP']['gpSigla']);

                            return;
                        }

                        $concelhoNome = title_pt($deputadoData['depCPDes']);
                        // $this->command->error("Concelho ".  $concelhoNome);
                        if ($concelhoNome === 'Madeira') {
                            $concelhoNome = 'Funchal';
                        } elseif ($concelhoNome === 'Açores') {
                            $concelhoNome = 'Ponta Delgada';
                        } elseif (! Str::contains($concelhoNome, 'Europa')) {
                            $concelho = Concelho::where('nome', $concelhoNome)->first();
                            if (! $concelho) {
                                $this->command->error('Concelho not found for '.$deputadoData['depCPDes']);

                                return;
                            }
                        }

                        Deputado::create([
                            'deputado_id' => $cidadaoCargo->id,
                            'parlamento_id' => $instituicaoLegislatura->id,
                            'partido_id' => $partido->id,
                            'concelho_id' => Str::contains($concelhoNome, 'Europa') ? null : $concelho->id,
                            'depCadID' => $deputadoData['depCadId'],
                            'depID' => $deputadoData['depId'],
                        ]);
                    }

                    if (! isset($orgao['Reunioes'])) {
                        $this->command->error('Reunioes not found for '.$orgao['nome']);

                        return;
                    }
                    $this->command->info('Processing reunioes...');
                    foreach ($orgao['Reunioes'] as $reuniaoData) {
                        // $this->command->info('Processing reuniao: ' . $reuniaoData['reuId']);
                        $reuniaoTipo = ReuniaoTipo::where('nome', 'Plenário - '.$reuniaoData['reuTirDes'])->first();
                        if (! $reuniaoTipo) {
                            $this->command->error('ReuniaoTipo '.'Plenário - '.$reuniaoData['reuTirDes'].' not found.');

                            return;
                        }
                        Reuniao::create([
                            'uuid' => Str::uuid(),
                            'nome' => null,
                            'sinopse' => null,
                            'tipo' => 'instituicao_legislatura',
                            'instituicao_id' => $instituicaoLegislatura->id,
                            'reunioes_tipo_id' => $reuniaoTipo->id,
                            'reuId' => $reuniaoData['reuId'],
                            'inicio' => $reuniaoData['reuDataHora'],
                            'termino' => null,
                            'parlamento_comissao_id' => null,
                            'reuNumero' => $reuniaoData['reuNumero'],
                            'selNumero' => $reuniaoData['selNumero'],
                        ]);
                    }

                }

                if ($orgao['nome'] === 'Comissões') {
                    $this->command->table(
                        ['Metric', 'Value'],
                        [
                            ['Nome', $orgao['nome']],
                            ['Count Comissões', isset($orgao['lista']) ? count($orgao['lista']) : 0],
                        ]
                    );

                    $this->command->info('Processing comissoes');
                    foreach ($orgao['lista'] as $comissoesData) {

                        if ($comissoesData['nome'] === 'Comissão Eventual' && isset($comissoesData['lista'])) {

                            $this->command->table(
                                ['Metric', 'Value'],
                                [
                                    ['Nome', $comissoesData['nome']],
                                    ['Count Comissões', isset($comissoesData['lista']) ? count($comissoesData['lista']) : 0],
                                ]
                            );

                            $tipoCC = ComissaoTipo::where('nome', $comissoesData['nome'])->first();
                            if (! $tipoCC) {
                                $this->command->error('ComissaoTipo '.$comissoesData['nome'].' not found.');

                                return;
                            }

                            foreach ($comissoesData['lista'] as $comissaoData) {

                                $comissao = Comissao::create([
                                    'uuid' => Str::uuid(),
                                    'sigla' => $comissaoData['siglaOrgao'],
                                    'nome' => title_pt($comissaoData['nomeSigla']),
                                    'sinopse' => null,
                                    'comissao_tipo_id' => $tipoCC->id,
                                    'tipo' => 'instituicao_legislatura',
                                    'instituicao_id' => $instituicaoLegislatura->id,
                                    'idOrgao' => $comissaoData['idOrgao'],
                                ]);

                                // $this->command->info('Created comissao '. $comissao->nome);

                                if (isset($comissaoData['Reunioes'])) {
                                    // $this->command->info('Processing '.count($comissaoData['Reunioes']).' reunioes para '.$comissao->nome);

                                    foreach ($comissaoData['Reunioes'] as $reuniaoData) {
                                        $reuniaoTipo = ReuniaoTipo::where('nome', $comissoesData['nome'].' - '.$reuniaoData['reuTirDes'])->firstOrFail();
                                        if (! $reuniaoTipo) {
                                            $this->command->error('ReuniaoTipo '.$comissoesData['nome'].' - '.$reuniaoData['reuTirDes'].' not found.');

                                            return;
                                        }
                                        Reuniao::create([
                                            'uuid' => Str::uuid(),
                                            'nome' => null,
                                            'sinopse' => null,
                                            'tipo' => 'instituicao_legislatura',
                                            'instituicao_id' => $instituicaoLegislatura->id,
                                            'reunioes_tipo_id' => $reuniaoTipo->id,
                                            'reuId' => $reuniaoData['reuId'],
                                            'inicio' => $reuniaoData['reuDataHora'],
                                            'termino' => null,
                                            'parlamento_comissao_id' => $comissao->id,
                                            'reuNumero' => $reuniaoData['reuNumero'],
                                        ]);
                                    }
                                }
                            }
                        }

                    }
                }

            }

        } catch (Exception $e) {
            echo 'Error: '.$e->getMessage()."\n";
            throw $e;
        } finally {
            // Log final statistics
            $finalStats = QueryLogger::getSummary();
            echo 'Seeder completed: '.json_encode([
                'total_queries' => $finalStats['total_queries'],
                'total_time' => $finalStats['total_time'],
                'average_query_time' => $finalStats['average_time'],
            ])."\n";

            QueryLogger::disable();
        }
    }
}
