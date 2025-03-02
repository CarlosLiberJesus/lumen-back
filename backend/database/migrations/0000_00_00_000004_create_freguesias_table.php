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
            $table->text('sinopse')->nullable();
            $table->unsignedBigInteger('distrito_id');
            $table->unsignedBigInteger('concelho_id');
            $table->unsignedBigInteger('freguesia_tipo_id');
            $table->timestamps();

            $table->foreign('distrito_id')->references('id')->on('distritos');
            $table->foreign('concelho_id')->references('id')->on('concelhos');
            $table->foreign('freguesia_tipo_id')->references('id')->on('freguesia_tipos');
        });

        DB::statement("COMMENT ON TABLE freguesias IS 'Reflete a organização territorial mais básica';");

    }

    public function down(): void
    {
        Schema::dropIfExists('freguesias');
    }
};
