<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Constituicao;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class ConstituicaoSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Constituicao::create(['uuid' => Str::uuid(), 'titulo' => 'Constituição da República Portuguesa',

            'link' => '',
            'legislatura_id' => 1]);

        $table->string('titulo');
        $table->string('link');
        $table->text('sinopse');
        $table->unsignedBigInteger('legislatura_id');
    }
}
