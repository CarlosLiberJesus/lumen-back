<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('legislaturas', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->char('sigla', 6)->nullable();
            $table->string('nome');
            $table->unsignedBigInteger('republica_id');
            $table->unsignedBigInteger('eleicao_id')->nullable();
            $table->date('formacao');
            $table->date('dissolucao')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->unique(['republica_id', 'sigla']);

            $table->foreign('republica_id')->references('id')->on('republicas');
            $table->foreign('eleicao_id')->references('id')->on('eleicoes');

        });

        DB::statement("COMMENT ON TABLE legislaturas IS 'Representa os ciclos das eleições e formação de Governo|Assembleia da Republica. Vai funcionar excelente para a actualidade pós 1974, republicas.id = 4, teremos de adaptar as anteriores.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('legislaturas');
    }
};
