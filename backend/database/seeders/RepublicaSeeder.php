<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Republica;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class RepublicaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Monarquia Constitucional', 'ano_inicio' => 1834, 'ano_fim' => 1910]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Primeira República', 'ano_inicio' => 1910, 'ano_fim' => 1926]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Segunda República', 'ano_inicio' => 1926, 'ano_fim' => 1974]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Terceira República', 'ano_inicio' => 1974]);
    }
}
