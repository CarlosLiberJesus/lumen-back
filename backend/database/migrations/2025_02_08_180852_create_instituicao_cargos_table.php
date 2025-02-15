<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_cargos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid');
            $table->string('cargo');
            $table->unsignedBigInteger('instituicao_id');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargos');
    }
};
