<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('deputados', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('deputado_id')->comment('Aponta para o cargo do cidadao');
            $table->unsignedBigInteger('parlamento_id')->nullable()->comment('Aponta para InstituicaoLegislatura, Assembleia da republica certa');
            $table->unsignedBigInteger('partido_id')->nullable()->comment('Aponta para Instituicao do partido que representa');
            $table->unsignedBigInteger('concelho_id')->nullable()->comment('Aponta para o distrito que representa');
            $table->integer('depCadID')->comment('Identificador do Cadastro do Deputado');
            $table->integer('depID')->comment('Identificador do Deputado');
            $table->timestamps();

            $table->foreign('deputado_id', 'fk_deputado_cargo_id')
                ->references('id')->on('cidadao_cargos');
            $table->foreign('parlamento_id', 'fk_deputado_parlamento_id')
                ->references('id')->on('instituicao_legislaturas');
            $table->foreign('partido_id', 'fk_deputado_partido_id')
                ->references('id')->on('instituicoes');
            $table->foreign('concelho_id', 'fk_deputado_concelho_id')
                ->references('id')->on('concelhos');

        });
    }

    public function down(): void
    {
        Schema::dropIfExists('deputados');
    }
};
