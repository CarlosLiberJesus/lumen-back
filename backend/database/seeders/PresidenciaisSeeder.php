<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Presidenciais;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class PresidenciaisSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'posse' => '15-05-1974', 'termino' => '30-09-1974']);
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'posse' => '30-09-1974', 'termino' => '14-07-1976']);
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'eleicoes' => '1976-06-27', 'posse' => '14-07-1976', 'termino' => '09-03-1986']);
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'eleicoes' => '1986-01-26', 'posse' => '09-03-1986', 'termino' => '09-03-1996']);
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'eleicoes' => '1996-01-14', 'posse' => '09-03-1996', 'termino' => '09-03-2006']);
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'eleicoes' => '2006-01-22', 'posse' => '09-03-2006', 'termino' => '09-03-2016']);
        Presidenciais::create(['uuid' => Str::uuid(), 'republica_id' => 4, 'eleicoes' => '2016-01-24', 'posse' => '09-03-2016']);
    }
}
