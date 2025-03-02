<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lei_partes', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->char('codigo', 2);
            $table->string('parte');
            $table->text('sinopse')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lei_partes');
    }
};
