<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('leis', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('codigo')->unique();
            $table->string('nome_completo');
            $table->unsignedBigInteger('instituicao_legislatura_id')->nullable();
            $table->unsignedBigInteger('instituicao_id')->nullable();
            $table->string('proponente')->nullable();
            $table->text('sumario')->nullable();
            $table->string('texto')->nullable();
            $table->boolean('em_vigor')->default(true);
            $table->date('data_toggle')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_legislatura_id')->references('id')->on('instituicao_legislaturas');
            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('leis');
    }
};
