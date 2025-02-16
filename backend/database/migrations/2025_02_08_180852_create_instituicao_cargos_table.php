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
            $table->unsignedBigInteger('instituicao_id');
            $table->timestamps();

            $table->foreign('instituicao_id')->references('id')->on('instituicoes');
        });

        DB::statement("ALTER TABLE instituicao_cargos COMMENT = 'Um Presidente da República é um cargo da instituição Presidencia da República, um Primeiro Ministro é um cargo da instituição Governo, um Presidente da Assembleia da Republica é um cargo da instituição Assembleia da Republica, etc.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('instituicao_cargos');
    }
};
