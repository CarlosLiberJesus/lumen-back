<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('cidadao_cargos', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('cidadao_id');
            $table->unsignedBigInteger('cargo_id')->comment('Cargo que ocupou, nascida da tabela instituicao_cargos. Exemplo: Deputado');
            $table->date('inicio')->nullable()->comment('Nullable pode acontecer excepções');
            $table->date('fim')->nullable();
            $table->text('sinopse')->nullable();
            $table->timestamps();

            $table->foreign('cidadao_id')->references('id')->on('cidadaos');
            $table->foreign('cargo_id')->references('id')->on('instituicao_cargos');
        });

        DB::statement("COMMENT ON TABLE cidadao_cargos IS 'Tabela super importante, que mapeará a carreira de um cidadão, com os cargos que ocupou, em que legislatura, etc.'");
    }

    public function down(): void
    {
        Schema::dropIfExists('cidadao_cargos');
    }
};
