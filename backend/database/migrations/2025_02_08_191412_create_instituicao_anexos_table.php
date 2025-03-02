<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("COMMENT ON TABLE instituicao_anexos IS 'Documentos genéricos para Instituição; não esquecer que pode ser preferível colocar em instituicao_legislatura_anexos, que são elas que devem estar activas'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_anexos');
    }
};
