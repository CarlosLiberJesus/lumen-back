<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('republicas', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('nome', 100);
            $table->date('inicio');
            $table->date('fim')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();
        });

        DB::statement("COMMENT ON TABLE republicas IS 'Representa os grandes ciclos históricos desde a Monarquia Constitucional até à atualidade. Exemplo: Primeira República, Estado Novo, Terceira República, etc.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('republicas');
    }
};
