<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('freguesias', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('name', 100);
            $table->json('descriptions')->nullable();
            $table->unsignedBigInteger('distrito_id');
            $table->unsignedBigInteger('concelho_id');
            $table->timestamps();

            $table->foreign('distrito_id')->references('id')->on('distritos')->onDelete('cascade');
            $table->foreign('concelho_id')->references('id')->on('concelhos')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('freguesias');
    }
};
