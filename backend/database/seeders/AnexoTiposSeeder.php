<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\AnexoTipo;
use Illuminate\Database\Seeder;

final class AnexoTiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        AnexoTipo::create(['tipo' => 'profile', 'description' => 'Imagem minima para procurar para preencher front-end']);
        AnexoTipo::create(['tipo' => 'image', 'description' => 'Imagens em geral, referências em tabela Própria']);
        AnexoTipo::create(['tipo' => 'video', 'description' => 'Vídeo']);
        AnexoTipo::create(['tipo' => 'audio', 'description' => 'Áudio']);
        AnexoTipo::create(['tipo' => 'document', 'description' => 'Documento']);
        AnexoTipo::create(['tipo' => 'other', 'description' => 'Outro']);
    }
}
