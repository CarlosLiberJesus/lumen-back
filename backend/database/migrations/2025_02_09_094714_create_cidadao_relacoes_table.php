<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadao_relacoes', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('cidadao_id');
            $table->unsignedBigInteger('com_cidadao_id');
            $table->unsignedBigInteger('relacao_tipo_id');
            $table->enum('onde', ['instituicoes', 'instituicao_legislatura', 'instituicao_presidenciais'])->nullable()->comment('Onde se passa a relação');
            $table->string('onde_id')->nullable()->comment('ID da relação');
            $table->timestamps();

            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
            $table->foreign('com_cidadao_id')->references('id')->on('cidadaos');
            $table->foreign('relacao_tipo_id')->references('id')->on('relacao_tipos');
        });

        DB::statement("COMMENT ON TABLE cidadao_relacoes IS 'Tabela super importante para nested search. Neste Portugal nepotista, é importante saber quem relacionado com quem.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('cidadao_relacoes');
    }
};
