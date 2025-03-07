<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('governo_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('governo_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->timestamps();

            $table->foreign('governo_id')->references('id')->on('governos');
            $table->foreign('anexo_tipo_id')->references('id')->on('anexo_tipos');
        });

        DB::statement("COMMENT ON TABLE governo_anexos IS 'Anexos por governo.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('governo_anexos');
    }
};
