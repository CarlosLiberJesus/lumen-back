<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diario_republica_publicacoes', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('nome');
            $table->text('src')->nullable()->comment('Web link');
            $table->unsignedBigInteger('diario_republica_id');
            $table->unsignedBigInteger('serie_id')->comment('Série do Diário da República');
            $table->timestamps();

            $table->foreign('diario_republica_id')->references('id')->on('diario_republicas');
            $table->foreign('serie_id')->references('id')->on('diario_republica_series');
        });
        DB::statement("ALTER TABLE diario_republica_publicacoes COMMENT = 'Tabela complexa, que representa uma publicacao do diário da republica, que pode ter mais de uma série. Exemplo nome: Diário da República n.º 32/2025, Série I de 2025-02-14; Exemplo src: https://diariodarepublica.pt/dr/detalhe/diario-republica/32-2025-907468769'");

    }

    public function down(): void
    {
        Schema::dropIfExists('diario_republica_publicacoes');
    }
};
