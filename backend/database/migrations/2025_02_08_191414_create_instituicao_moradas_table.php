<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_moradas', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->text('morada');
            $table->string('codigo_postal', 10)->nullable();
            $table->string('localidade', 100)->nullable();
            $table->unsignedBigInteger('concelho_id')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('concelho_id')->references('id')->on('concelhos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_moradas');
    }
};
