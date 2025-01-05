<?php

namespace Database\Seeders;

use App\Models\Status;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class NewsletterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'name' => 'Activo',
            'color' => json_encode([
                'hex' => '#17c653',
                'bootstrap' => 'success',
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'name' => 'Registado',
            'color' => json_encode([
                'hex' => '#f6c000',
                'bootstrap' => 'warning',
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'name' => 'Suspenso',
            'color' => json_encode([
                'hex' => '#f8285a',
                'bootstrap' => 'danger',
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'name' => 'Inactivo',
            'color' => json_encode([
                'hex' => '#f9f9f9',
                'bootstrap' => 'secondary',
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'name' => 'Apagado',
            'color' => json_encode([
                'hex' => '#1e2129',
                'bootstrap' => 'dark',
            ]),
        ]);
    }
}
