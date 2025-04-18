<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('eleicoes', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->unsignedBigInteger('eleicao_tipo_id');
            $table->date('data')->nullable();
            $table->string('data_desconhecida', 7)->nullable();
            $table->longText('sinopse')->nullable();
            $table->timestamps();

            $table->foreign('eleicao_tipo_id')->references('id')->on('eleicao_tipos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('eleicoes');
    }
};
