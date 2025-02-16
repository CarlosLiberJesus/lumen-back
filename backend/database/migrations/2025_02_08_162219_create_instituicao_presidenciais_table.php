<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('instituicao_presidenciais', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('nome')->nullable();
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('presidencial_id');
            $table->date('data_inicio')->nullable();
            $table->date('data_fim')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
            $table->foreign('presidencial_id')->references('id')->on('presidenciais');
        });

        DB::statement("ALTER TABLE instituicao_presidenciais COMMENT = 'Como as instituicao_legislativas, algumas instituições, como o conselho de estado mudam com as eleições do presidente .'");

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instituicao_presidenciais');
    }
};
