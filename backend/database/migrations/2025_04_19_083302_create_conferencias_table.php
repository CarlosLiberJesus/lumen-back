<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('conferencias', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('sigla')->nullable();
            $table->string('nome')->nullable();
            $table->longText('sinopse')->nullable();
            $table->unsignedBigInteger('conferencia_tipo_id');
            $table->enum('tipo', ['instituicao', 'instituicao_legislatura', 'instituicao_presidencial', 'instituicao_governo'])->comment('Cargo pode ser de uma instituição, ou dos seus filhos temporais');
            $table->unsignedBigInteger('instituicao_id');
            $table->integer('idOrgao')->nullable()->comment('Valor do Parlamento.pt');
            $table->timestamps();

            $table->foreign('conferencia_tipo_id', 'fk_conferencia_tipo_id')
                ->references('id')->on('conferencia_tipos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('conferencias');
    }
};
