<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('presidencial_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('presidencial_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->string('descricao', 255)->nullable();
            $table->timestamps();

            $table->foreign('presidencial_id')->references('id')->on('presidenciais');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("COMMENT ON TABLE presidencial_anexos IS 'Devido à estrutura da DB, acaba por ser os documentos do ramo do executivo mas da Presidencia da República, por presidente representado presidencial_id. Não esquecer que existe uma mais importante instituicao_presidencial_anexos.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('presidencial_anexos');
    }
};
