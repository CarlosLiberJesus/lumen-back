<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_dados', function (Blueprint $table): void {
            $table->id();
            $table->double('nif')->unique()->nullable();
            $table->text('certidao_permanente')->nullable();
            $table->unsignedBigInteger('instituicao_id');
            $table->text('sinopse')->nullable();
            $table->integer('fundacao')->nullable();
            $table->integer('dissolucao')->nullable();
            /**
             * TODO: temos de um fast way do board members... talvez metodo count() no model para cargos
             * $table->string('duracao_mandato')->nullable();
             * $table->text('membros')->nullable()->comment('TODO: no parlamento.pt temo');
             * $table->string('membros_parlamento')->nullable();
             */
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_dados');
    }
};
