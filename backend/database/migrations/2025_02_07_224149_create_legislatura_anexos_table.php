<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('legislatura_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('legislatura_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->timestamps();

            $table->foreign('legislatura_id')->references('id')->on('legislaturas');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });
        DB::statement("COMMENT ON TABLE legislatura_anexos IS 'Devido à estrutura da DB, acaba por ser os documentos do ramo do executivo do Governo, por presidente representado legislatura_id. Não esquecer que existe uma mais importante instituicao_legislatura_anexos.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('legislatura_anexos');
    }
};
