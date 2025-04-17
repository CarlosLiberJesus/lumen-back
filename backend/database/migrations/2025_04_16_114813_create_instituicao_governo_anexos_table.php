<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_governo_anexos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('instituicao_governo_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->string('descricao', 255)->nullable();
            $table->timestamps();

            $table->foreign('instituicao_governo_id', 'fk_governo_id')
                ->references('id')->on('instituicao_governos');
            $table->foreign('anexo_tipo_id', 'fk_inst_gov_anexo_tipo_id')
                ->references('id')->on('anexo_tipos');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_governo_anexos');
    }
};
