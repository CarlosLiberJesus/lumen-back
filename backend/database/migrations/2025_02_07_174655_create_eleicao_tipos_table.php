<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('eleicao_tipos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('tipo')->comment('Ex: Eleição de Presidente, Eleição de Parlamento, etc.');
            $table->text('sinopse')->nullable()->comment('Pequena descrição do tipo eleição');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('eleicao_tipos');
    }
};
