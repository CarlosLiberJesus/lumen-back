<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('conselho_ministroses', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->unsignedBigInteger('legislatura_id');
            $table->unsignedBigInteger('cargo_id')->comment('O cargo que o cidadao ocupa na instituicao_legislativas principalmente.');
            $table->unsignedBigInteger('cidadao_id');
            $table->timestamps();

            $table->foreign('legislatura_id')->references('id')->on('legislaturas');
            $table->foreign('cargo_id')->references('id')->on('instituicao_cargos');
            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
        });

        DB::statement("COMMENT ON TABLE conselho_ministroses IS 'Tabela de resumo de cargos principais que acompanham o Governo.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('conselho_ministroses');
    }
};
