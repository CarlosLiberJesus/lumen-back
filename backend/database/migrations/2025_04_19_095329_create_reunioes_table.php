<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('reunioes', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome')->nullable();
            $table->longText('sinopse')->nullable();
            $table->enum('tipo', ['instituicao', 'instituicao_legislatura', 'instituicao_presidencial', 'instituicao_governo'])->comment('Cargo pode ser de uma instituição, ou dos seus filhos temporais');
            $table->unsignedBigInteger('instituicao_id');
            $table->unsignedBigInteger('reunioes_tipo_id')->comment('Mesmo com cada Instituicao bem Mapeada, pode ainda ter que respeitar regras da mesma; exemplo Parlamento No tempo, mais a "equipa" que pertence');
            $table->integer('reuId')->comment('Valor do Parlamento.pt');
            $table->integer('reuNumero')->comment('Valor do Parlamento.pt. No mesmo tipo, até ajuda a numerar a ordem');
            $table->string('selNumero')->nullable()->comment('Valor do Parlamento.pt, apenas para Sessões Parlamentares');
            $table->datetime('inicio');
            $table->datetime('termino')->nullable();
            $table->unsignedBigInteger('parlamento_comissao_id')->nullable()->comment('Comissões podem gerar subcomissões, grupos de trabalho, etc');
            $table->timestamps();

            $table->foreign('reunioes_tipo_id', 'fk_reunioes_tipo_id')
                ->references('id')->on('reuniao_tipos');
            $table->foreign('parlamento_comissao_id', 'fk_parlamento_comissao_id')
                ->references('id')->on('comissoes');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('reunioes');
    }
};
