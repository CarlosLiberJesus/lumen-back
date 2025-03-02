<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\FreguesiaTipo;
use Illuminate\Database\Seeder;

final class FreguesiaTiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        FreguesiaTipo::create([
            'tipo' => 'União de Freguesias',
            'descricao' => 'Freguesias que foram formadas pela união de duas ou mais freguesias.',
        ]);
        FreguesiaTipo::create([
            'tipo' => 'Freguesia',
            'descricao' => 'Freguesias que se mantiveram após a reorganização territorial.',
        ]);
        FreguesiaTipo::create([
            'tipo' => 'Freguesia Extinta',
            'descricao' => 'Freguesias que se extinguiram após a reorganização territorial.',
        ]);

    }
}
