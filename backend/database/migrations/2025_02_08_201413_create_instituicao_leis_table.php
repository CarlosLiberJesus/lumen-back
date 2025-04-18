<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_leis', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('lei_id');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('lei_id')->references('id')->on('leis');
        });

        DB::statement("COMMENT ON TABLE instituicao_leis IS 'Tabela que mapeará os direitos e deveres de uma instituição, com base nas leis que a regem.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_leis');
    }
};
