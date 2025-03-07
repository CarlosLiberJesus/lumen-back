<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('distritos', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->string('nome', 100);
            $table->text('sinopse')->nullable();
            $table->timestamps();
        });

        DB::statement("COMMENT ON TABLE distritos IS 'Reflete a organização territorial a nível de regiões.';");

    }

    public function down(): void
    {
        Schema::dropIfExists('distritos');
    }
};
