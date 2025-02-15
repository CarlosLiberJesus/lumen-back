<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_contactos', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('contacto_tipo_id');
            $table->text('contacto');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('contacto_tipo_id')->references('id')->on('contacto_tipos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_contactos');
    }
};
