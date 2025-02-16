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
        Schema::create('entidade_juridica_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('entidades_juridica_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('path')->nullable()->comment('Caminho em server do arquivo');
            $table->string('src')->nullable()->comment('URL Fonte do arquivo');
            $table->timestamps();

            $table->foreign('entidades_juridica_id')->references('id')->on('entidade_juridicas');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');

        });
        DB::statement("ALTER TABLE entidade_juridica_anexos COMMENT = 'Atalhar as nossas procuras, lançar links externos de interesse, imagens, etc';");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('entidade_juridica_anexos');
    }
};
