<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_roles', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('role_id');
            $table->unsignedBigInteger('cargo_id')->nullable();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('role_id')->references('id')->on('roles');
            $table->foreign('cargo_id')->references('id')->on('role_cargos');
            $table->timestamps();
        });
        DB::statement("ALTER TABLE user_roles COMMENT = 'Maneira preferida de permissões, o role dá em bloco. Pode ter cargo extensível no role'");

    }

    public function down(): void
    {
        Schema::dropIfExists('user_roles');
    }
};
