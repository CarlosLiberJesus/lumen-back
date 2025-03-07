<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_governos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('governo_id');
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('governo_id')->references('id')->on('governos');
        });

        DB::statement("COMMENT ON TABLE instituicao_governos IS 'Conceito que desmultiplica uma instituição tipo Governo, para um governo especifico.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_governos');
    }
};
