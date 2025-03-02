<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_com_tipos', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('instituicao_tipo_id');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('instituicao_tipo_id')->references('id')->on('instituicao_tipos');
        });

        DB::statement("COMMENT ON TABLE instituicao_com_tipos IS 'Com a tabela 1:n de instituicoes para tipos de instituicoes, podemos ter executivo e saúde na mesma instituição.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_com_tipos');
    }
};
