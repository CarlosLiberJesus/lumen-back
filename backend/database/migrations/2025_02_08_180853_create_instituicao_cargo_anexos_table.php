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
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->string('descricao', 255)->nullable();
            $table->timestamps();

            $table->foreign('instituicao_cargo_id')->references('id')->on('instituicao_cargos');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("COMMENT ON TABLE instituicao_cargo_anexos IS 'Documentos genéricos para Instituição Cargo, não esquecer que deverá ser no cidadão que individualmente se colocam os documentos, na tabela cidadao_cargo_anexos'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargo_anexos');
    }
};
