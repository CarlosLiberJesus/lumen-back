<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadao_dados', function (Blueprint $table): void {
            $table->id();
            $table->double('nif')->unique()->nullable();
            $table->double('cc')->unique()->nullable();
            $table->char('cc_aux', 5)->nullable();
            $table->double('seg_social')->unique()->nullable();
            $table->double('n_saude')->unique()->nullable();
            $table->unsignedBigInteger('cidadao_id');
            $table->timestamps();

            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('cidadao_dados');
    }
};
