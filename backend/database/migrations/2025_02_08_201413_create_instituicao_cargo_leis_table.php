<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_cargo_leis', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_cargo_id');
            $table->unsignedBigInteger('lei_id');
            $table->timestamps();

            $table->foreign('instituicao_cargo_id')->references('id')->on('instituicao_cargos');
            $table->foreign('lei_id')->references('id')->on('leis');
        });

        DB::statement("ALTER TABLE instituicao_cargo_leis COMMENT = 'As instituições criam cargos, mas os cargos devem existir dentro de uma autorização legal. Tabela para associar leis que rondam os direitos e deveres dos cargos.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargo_leis');
    }
};
