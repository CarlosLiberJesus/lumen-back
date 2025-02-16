<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_presidencial_anexos', function (Blueprint $table): void {
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('instituicao_presidencial_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('path')->nullable()->comment('Caminho em server do arquivo');
            $table->string('src')->nullable()->comment('URL Fonte do arquivo');
            $table->timestamps();

            $table->foreign('instituicao_presidencial_id', 'fk_presidencial_id')
                ->references('id')->on('instituicao_presidenciais');
            $table->foreign('anexo_tipo_id', 'fk_inst_pres_anexo_tipo_id')
                ->references('id')->on('anexo_tipos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_presidencial_anexos');
    }
};
