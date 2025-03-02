<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lei_tipos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('tipo');
            $table->text('sinopse')->nullable();
            $table->timestamps();
        });

        DB::statement("COMMENT ON TABLE lei_tipos IS 'Para não inferir do nome do documento, agrupamos por tipo.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('lei_tipos');
    }
};
