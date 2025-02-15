<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('leis', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique()->index();
            $table->string('codigo')->unique();
            $table->string('nome_completo');
            $table->string('proponente')->nullable()->comment('Caso não se conheça o emissor fica a string extraída');
            $table->text('sumario')->nullable()->comment('Resumo da lei, extraido da web');
            $table->longText('texto')->nullable()->comment('Texto da lei, extraido da web');
            $table->longText('path')->nullable()->comment('Caminho para path o ficheiro da lei');
            $table->boolean('em_vigor')->default(true);
            $table->date('data_toggle')->nullable()->comment('Leis começam activas, mas mudam para inactivas quando são revogadas ou substituídas');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('leis');
    }
};
