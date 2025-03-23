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
        Schema::create('instituicao_entidade_juridicas', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('entidade_juridica_id')->nullable();
            $table->unsignedBigInteger('instituicao_id')->nullable();
            $table->timestamps();

            $table->foreign('entidade_juridica_id')->references('id')->on('entidade_juridicas');
            $table->foreign('instituicao_id')->references('id')->on('instituicoes');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instituicao_entidade_juridicas');
    }
};
