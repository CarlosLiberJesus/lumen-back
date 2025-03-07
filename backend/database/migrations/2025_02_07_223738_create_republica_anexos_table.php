<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('republica_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('republica_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->string('descricao', 255)->nullable();
            $table->timestamps();

            $table->foreign('republica_id')->references('id')->on('republicas');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');

        });
        DB::statement("COMMENT ON TABLE republica_anexos IS 'Atalhar as nossas procuras à Republica, lançar links externos de interesse, imagens, etc';");
    }

    public function down(): void
    {
        Schema::dropIfExists('republica_anexos');
    }
};
