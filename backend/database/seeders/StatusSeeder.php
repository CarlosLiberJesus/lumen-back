<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Status;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class StatusSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'status' => 'Activo',
            'params' => json_encode([
                'color' => [
                    'hex' => '#17c653',
                    'bootstrap' => 'success',
                ],
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'status' => 'Registado',
            'params' => json_encode([
                'color' => [
                    'hex' => '#f6c000',
                    'bootstrap' => 'warning',
                ],
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'status' => 'Suspenso',
            'params' => json_encode([
                'color' => [
                    'hex' => '#f8285a',
                    'bootstrap' => 'danger',
                ],
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'status' => 'Inactivo',
            'params' => json_encode([
                'color' => [
                    'hex' => '#f9f9f9',
                    'bootstrap' => 'secondary',
                ],
            ]),
        ]);
        Status::create([
            'uuid' => Str::uuid(),
            'type' => 'users',
            'status' => 'Apagado',
            'params' => json_encode([
                'color' => [
                    'hex' => '#1e2129',
                    'bootstrap' => 'dark',
                ],
            ]),
        ]);
    }
}
