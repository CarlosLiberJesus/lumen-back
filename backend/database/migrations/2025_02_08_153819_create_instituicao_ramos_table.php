<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_ramos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('tipo');
            $table->text('descricao');
            $table->timestamps();
        });

        DB::statement("ALTER TABLE instituicao_ramos COMMENT = 'Odeio o Nome desta tabela, é uum conceito teorico, que vai ajudar a filtrar as instituições. Inicialmente para mapear o ramo legislativo | executivo | judicial mas a complexidade de ONGs também vai entrar em conta.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_ramos');
    }
};
