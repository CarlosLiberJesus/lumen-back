<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('aplicacoes', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('name');
            $table->string('slug');
            $table->text('description')->nullable();
            $table->timestamps();
        });
        /**
         * TODO:
         * Seria muito mais interessante o site mandar para um proxy que injectaria o token de autorização lá, para não se ver o request do site
         */
        DB::statement("COMMENT ON TABLE aplicacoes IS 'O campo uuid conta com token de autorização. Layer simples seg, que pode descartar algumas tentativas remotas de acesso.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('aplicacoes');
    }
};
