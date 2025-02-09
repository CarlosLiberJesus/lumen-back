<?php

declare(strict_types=1);

namespace Database\Seeders;

use Illuminate\Database\Seeder;

final class MediaTypesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        MediaType::create(['type' => 'profile', 'description' => 'Imagem Pessoal']);
        MediaType::create(['type' => 'image', 'description' => 'Imagem Genérica']);
        MediaType::create(['type' => 'video', 'description' => 'Vídeo']);
        MediaType::create(['type' => 'audio', 'description' => 'Áudio']);
        MediaType::create(['type' => 'document', 'description' => 'Documento']);
        MediaType::create(['type' => 'other', 'description' => 'Outro']);
    }
}
