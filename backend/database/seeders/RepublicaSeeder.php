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
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Monarquia Absoluta', 'ano_inicio' => 1736, 'ano_fim' => 1822]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Monarquia Constitucional', 'ano_inicio' => 1822, 'ano_fim' => 1910]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Primeira República, Ditadura Militar e Ditadura Nacional', 'ano_inicio' => 1910, 'ano_fim' => 1933]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Estado Novo', 'ano_inicio' => 1933, 'ano_fim' => 1974]);
        Republica::create(['uuid' => Str::uuid(), 'nome' => 'Terceira República', 'ano_inicio' => 1974]);
    }
}
