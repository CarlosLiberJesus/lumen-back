<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\LeiParte;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class LeiPartesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'A', 'parte' => 'Presidência da República']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'B', 'parte' => 'Assembleia da República']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'C', 'parte' => 'Governo e Administração direta e indireta do Estado']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'D', 'parte' => 'Tribunais e Ministério Público']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'E', 'parte' => 'Entidades administrativas independentes e Administração autónoma']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'F', 'parte' => 'Regiões Autónomas']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'G', 'parte' => 'Empresas públicas']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'H', 'parte' => 'Autarquias locais']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'I', 'parte' => 'Outras entidades']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'J1', 'parte' => 'Administração Pública - Concursos para Cargos Dirigentes']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'J2', 'parte' => 'Administração Pública - Alterações Excecionais de Posições Remuneratórias']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'J3', 'parte' => 'Administração Pública - Relações Coletivas de Trabalho']);
        LeiParte::create(['uuid' => Str::uuid(), 'codigo' => 'L', 'parte' => 'Contratos públicos']);

    }
}
