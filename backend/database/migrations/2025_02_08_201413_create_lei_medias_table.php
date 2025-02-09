<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lei_medias', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome')->nullable();
            $table->unsignedBigInteger('lei_id');
            $table->unsignedBigInteger('media_type_id');
            $table->string('path')->nullable();
            $table->string('url')->nullable();
            $table->timestamps();

            $table->foreign('lei_id')->references('id')->on('leis');
            $table->foreign('media_type_id')->references('id')->on('media_types');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lei_medias');
    }
};
