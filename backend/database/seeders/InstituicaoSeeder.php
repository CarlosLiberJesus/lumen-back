<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Instituicao;
use App\Models\InstituicaoComRamo;
use App\Models\InstituicaoLegislatura;
use App\Models\Legislatura;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class InstituicaoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Presidência da República', 'instituicao_ramo_id' => 1]);
        InstituicaoComRamo::create(['instituicao_id' => 1, 'instituicao_ramo_id' => 1]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Assembleia da República', 'instituicao_ramo_id' => 2]);
        InstituicaoComRamo::create(['instituicao_id' => 2, 'instituicao_ramo_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Parlamento', 'instituicao_ramo_id' => 1, 'responde_instituicao_id' => 2]);
        InstituicaoComRamo::create(['instituicao_id' => 3, 'instituicao_ramo_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Mesa Assembleia da República', 'instituicao_ramo_id' => 1, 'responde_instituicao_id' => 3]);
        InstituicaoComRamo::create(['instituicao_id' => 4, 'instituicao_ramo_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Governo', 'instituicao_ramo_id' => 3, 'responde_instituicao_id' => 1]);
        InstituicaoComRamo::create(['instituicao_id' => 5, 'instituicao_ramo_id' => 3]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Concelho-Ministros', 'instituicao_ramo_id' => 3, 'responde_instituicao_id' => 5]);
        InstituicaoComRamo::create(['instituicao_id' => 6, 'instituicao_ramo_id' => 3]);

        $legislaturas = Legislatura::all();
        foreach ($legislaturas as $legislatura) {
            InstituicaoLegislatura::create([
                'uuid' => Str::uuid(),
                'instituicao_id' => 2,
                'legislatura_id' => $legislatura['id'],
                'nome' => $legislatura['code'] === '-' ? $legislatura['nome'] : $legislatura['code'].' '.$legislatura['nome'],
                'data_inicio' => $legislatura['formacao'],
                'data_fim' => $legislatura['dissolucao'],
            ]);

        }

        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 16, 'nome' => 'XXIV Governo Constitucional', 'data_inicio' => '2024-04-02']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 15, 'nome' => 'XXIII Governo Constitucional', 'data_inicio' => '2022-03-30', 'data_fim' => '2024-04-02']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 14, 'nome' => 'XXII Governo Constitucional', 'data_inicio' => '2019-10-26', 'data_fim' => '2022-03-30']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 13, 'nome' => 'XXI Governo Constitucional', 'data_inicio' => '2015-11-26', 'data_fim' => '2019-10-26']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 12, 'nome' => 'XX Governo Constitucional', 'data_inicio' => '2015-10-30', 'data_fim' => '2015-11-26']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 11, 'nome' => 'XIX Governo Constitucional', 'data_inicio' => '2011-06-20', 'data_fim' => '2015-10-30']);

        InstituicaoCargo::create(['uuid' => Str::uuid(), 'instituicao_id' => 1, 'cargo' => 'Presidente da República']);
        InstituicaoCargo::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'cargo' => 'Primeiro-Ministro']);
        InstituicaoCargo::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'cargo' => 'Secretário de Estado Adjunto do Primeiro-Ministro']);

        Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'Marcelo Rebelo de Sousa']);
        CidadaoCargo::create(['cidadao_id' => 1, 'cargo_id' => 1, 'inicio' => '2016-03-09']);
        Cidadao::create(['uuid' => Str::uuid(), 'nome' => 'António Costa']);
        CidadaoCargo::create(['cidadao_id' => 2, 'cargo_id' => 2, 'inicio' => '2015-11-26', 'fim' => '2019-10-26']);

    }
}
