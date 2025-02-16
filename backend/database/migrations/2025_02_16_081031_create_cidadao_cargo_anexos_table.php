<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadao_cargo_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('cidadao_cargo_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('path')->nullable()->comment('Caminho em server do arquivo');
            $table->string('src')->nullable()->comment('URL Fonte do arquivo');
            $table->timestamps();

            $table->foreign('cidadao_cargo_id')->references('id')->on('cidadao_cargos');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("ALTER TABLE cidadao_cargo_anexos COMMENT = 'Tentativa de armazenar anexos de cargos de cidadãos, para fiscalização de documentos, não esquecer que deverá ser na tabela cidadao_anexos coisas genéricas à pessoa, aqui ao cargo e nomeação'");

    }

    public function down(): void
    {
        Schema::dropIfExists('cidadao_cargo_anexos');
    }
};
