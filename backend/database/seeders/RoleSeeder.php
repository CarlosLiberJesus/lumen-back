<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\Role;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

final class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Role::create(['uuid' => Str::uuid(), 'name' => 'Open-Source', 'code' => 'sys-admin', 'description' => 'Pessoas que desenvolvem código...', 'params' => json_encode([
            'color' => [
                'hex' => '#f6c000',
                'bootstrap' => 'warning',
            ],
            'icon' => 'fa fa-code',
        ])]);
        Role::create(['uuid' => Str::uuid(), 'name' => 'Operadores', 'code' => 'management', 'description' => 'Utilizadores que ficaram com responsabilidades', 'params' => json_encode([
            'color' => [
                'hex' => '#056EE9',
                'bootstrap' => 'primary',
            ],
            'icon' => 'fa fa-user-tie',
        ])]);
        Role::create(['uuid' => Str::uuid(), 'name' => 'Utilizador Registado', 'code' => 'user', 'description' => 'Utilizadores Resgistados', 'params' => json_encode([
            'color' => [
                'hex' => '#04B440',
                'bootstrap' => 'success',
            ],
            'icon' => 'fa fa-user',
        ])]);
    }
}
