<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_comentarios', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->enum('em', ['users', 'instituicoes', 'cidadaos', 'cidadao_cargos', 'instituicao_legislaturas', 'instituicao_presidencial', 'instituicao_cargo', 'instituicao_governo']);
            $table->unsignedBigInteger('comentario_id');
            $table->text('comentario');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
        });

        DB::statement("COMMENT ON TABLE user_comentarios IS 'Users com permissoes podem deixar comentários em vários objectos|tabelas. por em é a tabela, comentario_id o value da tabela';");

    }

    public function down(): void
    {
        Schema::dropIfExists('user_comentarios');
    }
};
