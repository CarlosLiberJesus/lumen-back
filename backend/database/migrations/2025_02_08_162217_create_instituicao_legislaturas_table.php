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
            $table->date('data_inicio')->nullable();
            $table->date('data_fim')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('legislatura_id')->references('id')->on('legislaturas');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_legislaturas');
    }
};
