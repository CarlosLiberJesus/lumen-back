<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('comissoes', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('sigla')->nullable();
            $table->string('nome')->nullable();
            $table->longText('sinopse')->nullable();
            $table->unsignedBigInteger('comissao_tipo_id');
            $table->enum('tipo', ['instituicao', 'instituicao_legislatura', 'instituicao_presidencial', 'instituicao_governo'])->comment('Cargo pode ser de uma instituição, ou dos seus filhos temporais');
            $table->unsignedBigInteger('instituicao_id');
            $table->integer('idOrgao')->comment('Valor do Parlamento.pt');
            $table->unsignedBigInteger('parlamento_comissao_id')->nullable()->comment('Comissões podem gerar subcomissões, grupos de trabalho, etc');
            $table->timestamps();

            $table->foreign('comissao_tipo_id', 'fk_comissao_tipo_id')
                ->references('id')->on('comissao_tipos');
            $table->foreign('parlamento_comissao_id', 'fk_parlamento_comissao_filho_id')
                ->references('id')->on('comissoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('comissoes');
    }
};
