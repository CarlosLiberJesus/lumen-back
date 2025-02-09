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
        Schema::create('lei_adendas_create', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('lei_original_id');
            $table->unsignedBigInteger('lei_adenda_id');
            $table->timestamps();

            $table->foreign('lei_original_id')->references('id')->on('leis');
            $table->foreign('lei_adenda_id')->references('id')->on('leis');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lei_adendas_create');
    }
};
