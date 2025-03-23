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
            $table->text('sinopse')->nullable()->comment('Descrição da instituição');
            $table->unsignedBigInteger('responde_instituicao_id')->nullable();
            $table->boolean('nacional')->default(true)->comment('Queria fazer isto, Vamos a ver que OGNs é que vão aparecer');
            $table->boolean('extinta')->default(false)->comment('Devido ao DRe, temos pré 1974 a true');
            $table->json('params')->nullable()->comment('Guardar configs do frontend');
            $table->timestamps();

            $table->foreign('responde_instituicao_id')->references('id')->on('instituicoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicoes');
    }
};
