<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diario_republica_publicacoes', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('nome');
            $table->text('src')->nullable()->comment('Web link');
            $table->unsignedBigInteger('diario_republica_id');
            $table->timestamps();

            $table->foreign('diario_republica_id')->references('id')->on('diario_republicas');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('diario_republica_publicacoes');
    }
};
