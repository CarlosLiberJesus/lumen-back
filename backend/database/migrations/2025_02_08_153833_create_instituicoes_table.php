<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicoes', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('nome');
            $table->string('sigla')->nullable();
            $table->text('sinopse')->nullable();
            $table->unsignedBigInteger('responde_instituicao_id')->nullable();
            $table->unsignedBigInteger('entidade_juridica_id')->nullable();
            $table->boolean('nacional')->default(true)->comment('Queria fazer isto, Vamos a ver que OGNs é que vão aparecer');
            $table->timestamps();

            $table->foreign('responde_instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('entidade_juridica_id')->references('id')->on('entidade_juridicas');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicoes');
    }
};
