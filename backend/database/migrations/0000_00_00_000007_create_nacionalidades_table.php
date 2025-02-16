<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('nacionalidades', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nacionalidade');
            $table->string('pais');
            $table->json('params')->nullable()->comment('Como outras, será classes de css para as bandeiras');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('nacionalidades');
    }
};
