<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('entidade_juridica_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('entidades_juridica_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->timestamps();

            $table->foreign('entidades_juridica_id')->references('id')->on('entidade_juridicas');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');

        });
        DB::statement("COMMENT ON TABLE entidade_juridica_anexos IS 'Atalhar as nossas procuras, lançar links externos de interesse, imagens, etc';");
    }

    public function down(): void
    {
        Schema::dropIfExists('entidade_juridica_anexos');
    }
};
