<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('contacto_tipos', function (Blueprint $table): void {
            $table->id();
            $table->string('tipo');
            $table->text('description')->nullable();
            $table->json('params')->nullable();
            $table->timestamps();

        });
        DB::statement("COMMENT ON TABLE contacto_tipos IS 'Separar emails, telefones, endereços, etc. Os params contêm arrays de parametros para o front-end (css classes)';");
    }

    public function down(): void
    {
        Schema::dropIfExists('contacto_tipos');
    }
};
