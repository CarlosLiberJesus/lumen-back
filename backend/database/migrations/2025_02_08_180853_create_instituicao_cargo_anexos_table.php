<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_cargo_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('instituicao_cargo_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('path')->nullable()->comment('Caminho em server do arquivo');
            $table->string('src')->nullable()->comment('URL Fonte do arquivo');
            $table->timestamps();

            $table->foreign('instituicao_cargo_id')->references('id')->on('instituicao_cargos');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("ALTER TABLE instituicao_cargo_anexos COMMENT = 'Documentos genéricos para Instituição Cargo, não esquecer que deverá ser no cidadão que individualmente se colocam os documentos, na tabela cidadao_cargo_anexos'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargo_anexos');
    }
};
