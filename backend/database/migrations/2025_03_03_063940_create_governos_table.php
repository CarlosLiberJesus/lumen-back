<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('governos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->char('sigla', 6);
            $table->string('nome');
            $table->unsignedBigInteger('republica_id');
            $table->unsignedBigInteger('legislatura_id');
            $table->date('formacao');
            $table->date('dissolucao')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->unique(['legislatura_id', 'sigla']);

            $table->foreign('republica_id')->references('id')->on('republicas');
            $table->foreign('legislatura_id')->references('id')->on('legislaturas');
        });

        DB::statement("COMMENT ON TABLE governos IS 'Listagens dos governos de Portugal, com data de formação e dissolução, e a que república pertence.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('governos');
    }
};
