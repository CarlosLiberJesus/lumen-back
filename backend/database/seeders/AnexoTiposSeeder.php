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
        AnexoTipo::create(['tipo' => 'profile', 'descricao' => 'Imagem minima para procurar para preencher front-end']);
        AnexoTipo::create(['tipo' => 'image', 'descricao' => 'Imagens em geral, referências em tabela Própria']);
        AnexoTipo::create(['tipo' => 'url', 'descricao' => 'Url da Internet']);
        AnexoTipo::create(['tipo' => 'path', 'descricao' => 'Path do servidor']);
        AnexoTipo::create(['tipo' => 'document', 'descricao' => 'Documento Remoto']);
        AnexoTipo::create(['tipo' => 'base64', 'descricao' => 'Encode Base64']);
        AnexoTipo::create(['tipo' => 'video', 'descricao' => 'Vídeo']);
        AnexoTipo::create(['tipo' => 'audio', 'descricao' => 'Áudio']);
        AnexoTipo::create(['tipo' => 'other', 'descricao' => 'Outro']);
    }
}
