<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('instituicao_cargos', function (Blueprint $table): void {
            $table->id();
            $table->uuid('uuid');
            $table->string('cargo');
            $table->enum('tipo', ['instituicao', 'instituicao_legislatura', 'instituicao_presidencial', 'instituicao_governo'])->comment('Cargo pode ser de uma instituição, ou dos seus filhos temporais');
            $table->unsignedBigInteger('instituicao_id')->comment('Instituição a que pertence o cargo');
            $table->unsignedBigInteger('cargo_responde_id')->nullable()->comment('Este cargo responde a outro cargo');
            $table->text('sinopse')->nullable();
            $table->json('params')->nullable()->comment('Guardar configs do frontend');
            $table->timestamps();

            $table->foreign('cargo_responde_id')->references('id')->on('instituicao_cargos');
        });

        DB::statement("COMMENT ON TABLE instituicao_cargos IS 'Um Cargo tem sempre de nascer de uma instituicao, o tipo vai repetir o cargo, mas fâ-ze-lo num ciclo temporal; Um Presidente da República é um cargo da instituição Presidencia da República, vai gerar vários presidentes, associado à sua caixa temporal'");
        /*
        SELECT
    cc.id AS cidadao_cargo_id,
    c.nome AS nome_cidadao,
    ic.cargo AS nome_cargo,
    ic.tipo AS tipo_cargo,
    cc.inicio,
    cc.fim,
    i.nome AS instituicao_nome
FROM cidadao_cargos cc
JOIN cidadaos c
    ON cc.cidadao_id = c.id
JOIN instituicao_cargos ic
    ON cc.cargo_id = ic.id
JOIN instituicao_governos ig
    ON ic.instituicao_id = ig.id
JOIN instituicoes i
    ON ig.instituicao_id = i.id
WHERE ig.governo_id = 7
ORDER BY cc.inicio, c.nome;
        */
    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargos');
    }
};
