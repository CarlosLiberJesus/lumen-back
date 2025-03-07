<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadaos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('nome');
            $table->string('nome_completo')->nullable();
            $table->date('data_nascimento')->nullable();
            $table->date('data_falecimento')->nullable();
            $table->char('genero', 1)->nullable();
            $table->unsignedBigInteger('freguesia_id')->nullable();
            $table->text('sinopse')->nullable();
            $table->boolean('nacional')->default(true)->comment('Não queria fazer isto, mas... está do DRe.');
            $table->timestamps();

            $table->foreign('freguesia_id')->references('id')->on('freguesias');
        });

        DB::statement("COMMENT ON TABLE cidadaos IS 'Acumulação dos Cidadãos que vamos apanhamos';");

    }

    public function down(): void
    {
        Schema::dropIfExists('cidadaos');
    }
};
