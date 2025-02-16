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
            $table->enum('em', ['users', 'instituicoes', 'cidadaos', 'cidadao_cargos', 'instituicao_legislaturas', 'instituicao_presidenciais']);
            $table->unsignedBigInteger('comentario_id');
            $table->text('comentario');
            $table->timestamps();
        });

        DB::statement("ALTER TABLE user_comentarios COMMENT = 'Users com permissoes podem deixar comentários em vários objectos|tabelas. por em é a tabela, comentario_id o value da tabela';");

    }

    public function down(): void
    {
        Schema::dropIfExists('user_comentarios');
    }
};
