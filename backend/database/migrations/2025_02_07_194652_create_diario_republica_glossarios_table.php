<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('diario_republica_glossarios', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome')->comment('Nome do glossário');
            $table->longText('texto')->nullable()->comment('Texto da lei, extraido da web');
            $table->string('path')->comment('Caminho em server do arquivo');
            $table->string('src')->comment('URL Fonte do arquivo');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('diario_republica_glossarios');
    }
};
