<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('entidade_juridica_leis', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome')->nullable();
            $table->unsignedBigInteger('entidade_juridica_id');
            $table->unsignedBigInteger('lei_id');
            $table->timestamps();

            $table->foreign('entidade_juridica_id')->references('id')->on('entidade_juridicas');
            $table->foreign('lei_id')->references('id')->on('leis');
        });

        DB::statement("ALTER TABLE entidade_juridica_leis COMMENT = 'Entidade Juridica é um termo legal que é coberto por definição legal. Tabela vai agregando as leis que impactam os direitos e deveres da entidade juridica.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('entidade_juridica_leis');
    }
};
