<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_legislaturas', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('nome')->nullable();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('legislatura_id');
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('legislatura_id')->references('id')->on('legislaturas');
        });

        DB::statement("COMMENT ON TABLE instituicao_legislaturas IS 'Conceito que desmultiplica uma instituição tipo Governo, para um governo especifico, formado devido às eleições de 2023, por exemplo.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_legislaturas');
    }
};
