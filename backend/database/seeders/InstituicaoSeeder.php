<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Instituicao;
use App\Models\InstituicaoCarater;
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
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Presidencial']);
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Legislativo']);
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Executivo']);
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Judicial']);
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Independente', 'descricao' => 'São estabelecidas para operar autonomamente do governo e da Assembleia da República. Têm funções de fiscalização, regulação ou supervisão, garantindo imparcialidade e objetividade']);
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Externo', 'descricao' => 'São organizações que interagem com a Assembleia da República, mas que não fazem parte da sua estrutura interna. Incluem agências governamentais, instituições públicas (como universidades) e organizações internacionais.']);
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Partido']);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Presidência da República', 'instituicao_carater_id' => 1]);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Assembleia da República', 'instituicao_carater_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Parlamento', 'instituicao_carater_id' => 1, 'responde_instituicao_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Mesa Assembleia da República', 'instituicao_carater_id' => 1, 'responde_instituicao_id' => 3]);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Governo', 'instituicao_carater_id' => 3, 'responde_instituicao_id' => 1]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Concelho-Ministros', 'instituicao_carater_id' => 3, 'responde_instituicao_id' => 5]);

        $legislaturas = Legislatura::all();
        foreach ($legislaturas as $legislatura) {
            InstituicaoLegislatura::create([
                'uuid' => Str::uuid(),
                'instituicao_id' => 2,
                'legislatura_id' => $legislatura['id'],
                'nome' => $legislatura['code'] === '-' ? $legislatura['nome'] : $legislatura['code'] . ' ' . $legislatura['nome'],
                'data_inicio' => $legislatura['formacao'],
                'data_fim' => $legislatura['dissolucao'],
            ]);
        }

        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 16, 'nome' => 'XXIV Governo Constitucional', 'data_inicio' => '2022-03-30', 'data_fim' => '2024-04-02']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 15, 'nome' => 'XXIII Governo Constitucional', 'data_inicio' => '2022-03-30', 'data_fim' => '2024-04-02']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 14, 'nome' => 'XXII Governo Constitucional', 'data_inicio' => '2019-10-26', 'data_fim' => '2022-03-30']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 13, 'nome' => 'XXI Governo Constitucional', 'data_inicio' => '2015-11-26', 'data_fim' => '2019-10-26']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 12, 'nome' => 'XX Governo Constitucional', 'data_inicio' => '2015-10-30', 'data_fim' => '2015-11-26']);
        InstituicaoLegislatura::create(['uuid' => Str::uuid(), 'instituicao_id' => 5, 'legislatura_id' => 11, 'nome' => 'XIX Governo Constitucional', 'data_inicio' => '2011-06-20', 'data_fim' => '2015-10-30']);
    }
}
