<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('leis', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->unsignedBigInteger('lei_tipo_id');
            $table->string('codigo');
            $table->string('nome_completo');
            $table->string('proponente')->nullable()->comment('Caso não se conheça o emissor fica a string extraída');
            $table->unsignedBigInteger('lei_parte_id')->nullable()->comment('Recente filtro por tipo de entidade');
            $table->text('sumario')->nullable()->comment('Resumo da lei, extraido da web');
            $table->longText('texto')->nullable()->comment('Texto da lei, extraido da web');
            $table->string('path')->nullable()->comment('Caminho em server do arquivo');
            $table->string('src')->nullable()->comment('URL Fonte do arquivo');
            $table->boolean('em_vigor')->default(true);
            $table->date('data_toggle')->nullable()->comment('Leis começam activas, mas mudam para outros quando são revogadas ou substituídas');
            $table->timestamps();

            $table->unique(['codigo', 'lei_tipo_id']);
            $table->foreign('lei_tipo_id')->references('id')->on('lei_tipos');
            $table->foreign('lei_parte_id')->references('id')->on('lei_partes');
        });

        DB::statement("COMMENT ON TABLE leis IS 'Tabela principal de leis, com todas as informações necessárias para a sua consulta e pesquisa.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('leis');
    }
};
