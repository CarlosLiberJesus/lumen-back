<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('freguesia_tipos', function (Blueprint $table): void {
            $table->id();
            $table->string('tipo');
            $table->string('descricao');
            $table->timestamps();
        });

        DB::statement("COMMENT ON TABLE freguesia_tipos IS 'Houve historicamente uma união de freguesia, marca o seu periodo';");

    }

    public function down(): void
    {
        Schema::dropIfExists('freguesia_tipos');
    }
};
