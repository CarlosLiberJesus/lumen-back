<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('conselho_ministros', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('governo_id')->comment('O governo a que pertence o conselho de ministros.');
            $table->unsignedBigInteger('cargo_id')->comment('O cargo que o cidadao ocupa na instituicao_governo principalmente.');
            $table->unsignedBigInteger('cidadao_id');
            $table->timestamps();

            $table->foreign('governo_id')->references('id')->on('governos');
            $table->foreign('cargo_id')->references('id')->on('instituicao_cargos');
            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
        });

        DB::statement("COMMENT ON TABLE conselho_ministros IS 'Tabela de resumo de cargos principais que acompanham o Governo.'");
        /*
SELECT
    cm.uuid,
    c.nome AS nome_cidadao,
    ic.cargo AS nome_cargo,
    cc.inicio,
    cc.fim
FROM conselho_ministros cm
JOIN cidadao_cargos cc
    ON cm.cargo_id = cc.cargo_id
    AND cm.cidadao_id = cc.cidadao_id
JOIN cidadaos c
    ON cm.cidadao_id = c.id
JOIN instituicao_cargos ic
    ON cm.cargo_id = ic.id
WHERE cm.instituicao_governo_id = 7;

        */
    }

    public function down(): void
    {
        Schema::dropIfExists('conselho_ministros');
    }
};
