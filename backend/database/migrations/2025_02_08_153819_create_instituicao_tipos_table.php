<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_tipos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('codigo')->nullable()->unique()->index();
            $table->string('tipo')->comment('Inicialmente para mapear o ramo legislativo | executivo | judicial mas a complexidade de ONGs também vai entrar em conta.');
            $table->text('sinopse')->nullable();
            $table->timestamps();
        });

        DB::statement("COMMENT ON TABLE instituicao_tipos IS 'Odeio o Nome desta tabela, é um conceito teorico, que vai ajudar a filtrar as instituições. Exemplo: Governo, Saúde, Educação, etc.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_tipos');
    }
};
