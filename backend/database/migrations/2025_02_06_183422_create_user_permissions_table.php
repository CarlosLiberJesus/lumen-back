<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('user_permissions', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('permission_id');
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('permission_id')->references('id')->on('permissions');
        });

        DB::statement("COMMENT ON TABLE user_permissions IS 'Permissões Extra se não coberto por roles.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('user_permissions');
    }
};
