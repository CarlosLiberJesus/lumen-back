<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('instituicoes', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->unsignedBigInteger('instituicao_carater_id');
            $table->string('nome');
            $table->string('sigla')->nullable();
            $table->string('link')->nullable();
            $table->text('descricao')->nullable();
            $table->unsignedBigInteger('responde_instituicao_id')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_carater_id')->references('id')->on('instituicao_caraters');
            $table->foreign('responde_instituicao_id')->references('id')->on('instituicoes');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instituicoes');
    }
};
