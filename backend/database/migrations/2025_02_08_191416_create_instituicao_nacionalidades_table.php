<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_nacionalidades', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('nacionalidade_id');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('nacionalidade_id')->references('id')->on('nacionalidades');
        });

        DB::statement("ALTER TABLE instituicao_nacionalidades COMMENT = 'Ou a instituicao tem o default true, ou tem de herdar multiplas nacionalidades. Tabela para associar instituicoes a nacionalidades.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_nacionalidades');
    }
};
