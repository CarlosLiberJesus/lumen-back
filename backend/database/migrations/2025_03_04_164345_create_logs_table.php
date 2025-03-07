<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('logs', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->unsignedBigInteger('aplicacao_id');
            $table->string('method');
            $table->integer('code');
            $table->string('url');
            $table->string('message')->nullable();
            $table->json('params')->nullable();
            $table->json('reply')->nullable();
            $table->integer('time');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('aplicacao_id')->references('id')->on('aplicacoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('logs');
    }
};
