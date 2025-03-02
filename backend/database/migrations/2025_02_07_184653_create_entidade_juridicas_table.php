<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('entidade_juridicas', function (Blueprint $table): void {
            $table->id();
            $table->string('nome');
            $table->text('sinopse')->nullable();
            $table->json('params')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('entidade_juridicas');
    }
};
