<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diario_republica_publicacao_leis', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('dr_publicacao_id');
            $table->unsignedBigInteger('lei_id');
            $table->text('src')->nullable()->comment('Web link');
            $table->string('paginas');
            $table->timestamps();

            $table->foreign('dr_publicacao_id')->references('id')->on('diario_republica_publicacoes');
            $table->foreign('lei_id')->references('id')->on('leis');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('diario_republica_publicacao_leis');
    }
};
