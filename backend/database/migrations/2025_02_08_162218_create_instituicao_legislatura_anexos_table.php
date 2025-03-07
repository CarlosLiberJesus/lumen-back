<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_legislatura_anexos', function (Blueprint $table): void {
            $table->string('uuid')->unique()->index();
            $table->string('nome');
            $table->unsignedBigInteger('instituicao_legislatura_id');
            $table->unsignedBigInteger('anexo_tipo_id');
            $table->string('anexo', 255)->comment('Ex: O URL do anexo');
            $table->string('descricao', 255)->nullable();
            $table->timestamps();

            $table->foreign('instituicao_legislatura_id', 'fk_legislatura_id')
                ->references('id')->on('instituicao_legislaturas');
            $table->foreign('anexo_tipo_id', 'fk_inst_leg_anexo_tipo_id')
                ->references('id')->on('anexo_tipos');
        });

        DB::statement("COMMENT ON TABLE instituicao_legislatura_anexos IS 'Durante os ciclos legislativos, a instituição tem uma nova versão pós formação de orgãos e gera informação'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_legislatura_anexos');
    }
};
