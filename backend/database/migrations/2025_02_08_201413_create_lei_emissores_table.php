<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lei_emissores', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('lei_id');
            $table->enum('emissor_tipo', ['instituicao', 'instituicao_legislatura', 'instituicao_presidencial', 'instituicao_cargo', 'instituicao_governo']);
            $table->unsignedBigInteger('emissor_id');
            $table->timestamps();

            $table->foreign('lei_id')->references('id')->on('leis');
        });

        DB::statement("COMMENT ON TABLE lei_emissores IS 'Única tabela para saber emissores; todas as outras tabelas *_leis são direitos e responsabilidade do tópico.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('lei_emissores');
    }
};
