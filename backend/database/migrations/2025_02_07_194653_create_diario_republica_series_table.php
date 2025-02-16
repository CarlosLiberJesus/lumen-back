<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diario_republica_series', function (Blueprint $table): void {
            $table->id();
            $table->string('nome');
            $table->text('sinopse');
            $table->unsignedBigInteger('serie_id')->nullable()->comment('As séries poderão ter suplementos, dentro de cada série, havemos de mapear também os suplementos');
            $table->timestamps();
        });

        DB::statement("ALTER TABLE diario_republica_series COMMENT = 'Dentro do Dre, cada publicacao vem dentro de series. Cada serie tem um proposito diferente.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('diario_republica_series');
    }
};
