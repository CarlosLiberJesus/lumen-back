<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('relacao_tipos', function (Blueprint $table): void {
            $table->id();
            $table->enum('entre', ['cidadaos', 'instituicoes', 'instituicao_cidadao']);
            $table->string('nome');
            $table->timestamps();
        });

        DB::statement("ALTER TABLE relacao_tipos COMMENT = 'Tabela de apoio entre relação entre cidadãos e instituições, sob uma justificação.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('relacao_tipos');
    }
};
