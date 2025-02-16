<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diario_republicas', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('nome');
            $table->date('publicacao')->unique();
            $table->timestamps();
        });

        DB::statement("ALTER TABLE diario_republicas COMMENT = 'Tabela que aceita uma data unica para publicação. 1 Diário da republica pode ter vários diario_republicas_publicacoes. Exemplo nome: Diário da República n.º 32/2025'");
    }

    public function down(): void
    {
        Schema::dropIfExists('diario_republicas');
    }
};
