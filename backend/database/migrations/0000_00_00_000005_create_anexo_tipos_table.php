<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('anexo_tipos', function (Blueprint $table): void {
            $table->id();
            $table->string('tipo', 50)->unique()->index();
            $table->string('descricao', 150)->nullable();
            $table->json('params')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('anexo_tipos');
    }
};
