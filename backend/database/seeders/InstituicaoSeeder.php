<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Seeder;

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
        InstituicaoCarater::create(['uuid' => Str::uuid(), 'tipo' => 'Independente']);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Presidência da República', 'instituicao_carater_id' => 1]);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Assembleia da República', 'instituicao_carater_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Parlamento', 'instituicao_carater_id' => 1, 'responde_instituicao_id' => 2]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Mesa Assembleia da República', 'instituicao_carater_id' => 1, 'responde_instituicao_id' => 3]);

        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Governo', 'instituicao_carater_id' => 3, 'responde_instituicao_id' => 1]);
        Instituicao::create(['uuid' => Str::uuid(), 'nome' => 'Concelho-Ministros', 'instituicao_carater_id' => 3, 'responde_instituicao_id' => 5]);
    }
}
