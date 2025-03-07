<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Aplicacao;
use Illuminate\Database\Seeder;

final class AplicacoesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Aplicacao::create(['uuid' => '3d924b69-0063-4943-824a-0d5bb445e7ca', 'slug' => 'http://localhost:4200', 'name' => 'Api DEV']);
        Aplicacao::create(['uuid' => '22993c21-2e98-454f-a1df-8b8d9c5150c1', 'slug' => 'https://bewhy.org', 'name' => 'Main App Api']);
    }
}
