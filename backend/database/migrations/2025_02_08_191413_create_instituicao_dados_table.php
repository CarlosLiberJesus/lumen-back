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
        Schema::create('instituicao_dados', function (Blueprint $table): void {
            $table->id();
            $table->double('nif')->unique()->nullable();
            $table->text('certidao_permanente')->nullable();
            $table->unsignedBigInteger('instituicao_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('instituicao_dados');
    }
};
