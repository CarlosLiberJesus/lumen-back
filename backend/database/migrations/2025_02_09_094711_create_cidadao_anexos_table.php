<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadao_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('cidadao_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->timestamps();

            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("COMMENT ON TABLE cidadao_anexos IS 'Documentos genéricos para o cidadão, como imagens ou outros links interessantes. não esquecer que deverá ser na tabela cidadao_cargo_anexos que teremos a maioria dos documentos, que são os que são específicos para cada cargo'");

    }

    public function down(): void
    {
        Schema::dropIfExists('cidadao_anexos');
    }
};
