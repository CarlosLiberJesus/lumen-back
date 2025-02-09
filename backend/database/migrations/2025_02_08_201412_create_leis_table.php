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
        Schema::create('leis', function (Blueprint $table): void {
            $table->id();
            $table->string('nome');
            $table->unsignedBigInteger('diario_republica_publicacao_id');
            $table->unsignedBigInteger('instituicao_legislatura_id');
            $table->text('sumario')->nullable();
            $table->string('texto')->nullable();
            $table->string('url');
            $table->timestamps();

            $table->foreign('diario_republica_publicacao_id')->references('id')->on('diario_republica_publicacoes');
            $table->foreign('instituicao_legislatura_id')->references('id')->on('instituicao_legislaturas');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leis');
    }
};
