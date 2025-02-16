<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('legislaturas', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('nome');
            $table->char('code', 6);
            $table->unsignedBigInteger('republica_id');
            $table->date('eleicoes')->nullable();
            $table->date('formacao');
            $table->date('dissolucao')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->unique(['republica_id', 'code']);

            $table->foreign('republica_id')->references('id')->on('republicas');
        });

        DB::statement("ALTER TABLE legislaturas COMMENT = 'Representa os ciclos das eleições e formação de Governo|Assembleia da Republica. Vai funcionar excelente para a actualidade pós 1974, republicas.id = 4, teremos de adaptar as anteriores.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('legislaturas');
    }
};
