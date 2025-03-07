<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('concelhos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome', 100);
            $table->text('sinopse')->nullable();
            $table->unsignedBigInteger('distrito_id');
            $table->timestamps();

            $table->foreign('distrito_id')->references('id')->on('distritos');
        });

        DB::statement("COMMENT ON TABLE concelhos IS 'Reflete a organização territorial a nível de municipio.';");

    }

    public function down(): void
    {
        Schema::dropIfExists('concelhos');
    }
};
