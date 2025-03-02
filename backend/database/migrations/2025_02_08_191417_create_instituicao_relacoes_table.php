<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_relacoes', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('com_instituicao_id')->nullable();
            $table->unsignedBigInteger('com_cidadao_id')->nullable();
            $table->unsignedBigInteger('relacao_tipo_id');

            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('com_instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('com_cidadao_id')->references('id')->on('cidadaos');
            $table->foreign('relacao_tipo_id')->references('id')->on('relacao_tipos');
        });

        DB::statement("COMMENT ON TABLE instituicao_relacoes IS 'Tabela super importante para nested search. Neste Portugal corrupto, é normal que certas instituições tenham relações de financiamento, nomeacao.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_relacoes');
    }
};
