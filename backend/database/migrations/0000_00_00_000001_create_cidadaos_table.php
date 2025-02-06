<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadaos', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('nome');
            $table->date('data_nascimento')->nullable();
            $table->double('nif')->unique()->nullable();
            $table->double('cc')->unique()->nullable();
            $table->char('cc_aux', 5)->nullable();
            $table->double('seg_social')->unique()->nullable();
            $table->double('n_saude')->unique()->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cidadaos');
    }
};
