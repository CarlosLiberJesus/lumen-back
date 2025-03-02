<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('permissions', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('code', 10)->unique()->index();
            $table->string('name', 100);
            $table->text('description')->nullable();
            $table->json('params')->nullable();
            $table->timestamps();
        });
        DB::statement("COMMENT ON TABLE permissions IS 'Unidade base de permissão.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('permissions');
    }
};
