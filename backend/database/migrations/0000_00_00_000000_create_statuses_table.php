<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('statuses', function (Blueprint $table): void {
            $table->id();
            $table->string('uuid')->unique()->index();
            $table->enum('tipo', ['users', 'documents', 'tasks']);
            $table->string('status', 50);
            $table->json('params');
            $table->text('descricao')->nullable();
            $table->timestamps();

            $table->index(['tipo', 'status'])->unique();
        });

        DB::statement("COMMENT ON TABLE statuses IS 'Tabela de apoio para objectos que tenham de ser confirmados no work-flow.'");

    }

    public function down(): void
    {
        Schema::dropIfExists('statuses');
    }
};
