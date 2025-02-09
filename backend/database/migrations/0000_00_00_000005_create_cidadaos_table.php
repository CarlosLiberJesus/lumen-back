<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadaos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('nome');
            $table->date('data_nascimento')->nullable();
            $table->date('data_falecimento')->nullable();
            $table->unsignedBigInteger('freguesia_id')->nullable();
            $table->timestamps();

            $table->foreign('freguesia_id')->references('id')->on('freguesias');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cidadaos');
    }
};
