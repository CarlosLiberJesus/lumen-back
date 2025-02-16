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
        Schema::create('legislatura_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('legislatura_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('path')->nullable()->comment('Caminho em server do arquivo');
            $table->string('src')->nullable()->comment('URL Fonte do arquivo');
            $table->timestamps();

            $table->foreign('legislatura_id')->references('id')->on('legislaturas');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });
        DB::statement("ALTER TABLE legislatura_anexos COMMENT = 'Devido à estrutura da DB, acaba por ser os documentos do ramo do executivo do Governo, por presidente representado legislatura_id. Não esquecer que existe uma mais importante instituicao_legislatura_anexos.'");

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('legislatura_anexos');
    }
};
