<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_com_ramos', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('instituicao_ramo_id');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('instituicao_ramo_id')->references('id')->on('instituicao_ramos');
        });

        DB::statement("ALTER TABLE instituicao_com_ramos COMMENT = 'Talvez este conceito Abstract seja interessante para extender legislativo | executivo | judicial mas ter grandes conceitos, como Cultura, Saude, Educação, etc.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_com_ramos');
    }
};
