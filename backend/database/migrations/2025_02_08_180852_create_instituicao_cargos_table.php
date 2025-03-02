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
            $table->enum('instituicao', ['instituicao', 'instituicao_legislatura', 'instituicao_presidencial'])->comment('Cargo pode ser de uma instituição, ou dos seus filhos temporais');
            $table->unsignedBigInteger('instituicao_id')->comment('Instituição a que pertence o cargo');
            $table->unsignedBigInteger('cargo_responde_id')->nullable()->comment('Este cargo responde a outro cargo');
            $table->timestamps();

            $table->foreign('cargo_responde_id')->references('id')->on('instituicao_cargos');
        });

        DB::statement("COMMENT ON TABLE instituicao_cargos IS 'Um Presidente da República é um cargo da instituição Presidencia da República, um Primeiro Ministro é um cargo da instituição Governo, um Presidente da Assembleia da Republica é um cargo da instituição Assembleia da Republica, etc.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargos');
    }
};
