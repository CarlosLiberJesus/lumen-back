<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('presidenciais', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->unsignedBigInteger('republica_id');
            $table->date('eleicoes')->nullable();
            $table->date('posse');
            $table->date('termino')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->foreign('republica_id')->references('id')->on('republicas');
        });
        DB::statement("COMMENT ON TABLE presidenciais IS 'Representa os ciclos das eleições de Presidente da Republica Republica. Vai funcionar excelente para a actualidade pós 1974, republicas.id = 4, talvez pós 1910, republicas.id > 2.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('presidenciais');
    }
};
