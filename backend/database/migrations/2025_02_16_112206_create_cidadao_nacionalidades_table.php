<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadao_nacionalidades', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('cidadao_id');
            $table->unsignedBigInteger('nacionalidade_id');
            $table->timestamps();

            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
            $table->foreign('nacionalidade_id')->references('id')->on('nacionalidades');
        });

        DB::statement("ALTER TABLE cidadao_nacionalidades COMMENT = 'Ou o cidadao tem o default true, ou tem de herdar multiplas nacionalidades. Tabela para associar cidadao a nacionalidades.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('cidadao_nacionalidades');
    }
};
