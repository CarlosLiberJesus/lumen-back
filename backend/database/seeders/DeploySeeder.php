<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\User;
use App\Models\UserRole;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

final class DeploySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $this->call(GeografiaSeeder::class);
        $this->call(StatusSeeder::class);
        $this->call(RoleSeeder::class);
        $this->call(AnexoTiposSeeder::class);
        $this->call(ContactoTiposSeeder::class);
        $this->call(AnexoTiposSeeder::class);
        $this->call(EntidadeJuridicasSeeder::class);

        User::create(['uuid' => Str::uuid(), 'name' => 'Operadores', 'status_id' => 1, 'rgpd' => true, 'email' => 'deployuser@bewhy.org', 'password' => Hash::make('1234')]);
        UserRole::create(['user_id' => 1, 'role_id' => 1]);

        $this->call(RepublicaSeeder::class);
        $this->call(PresidenciaisSeeder::class);
        $this->call(LegislaturaSeeder::class);
        $this->call(InstituicaoRamosSeeder::class);
        // $this->call(InstituicaoSeeder::class);
        // $this->call(LeisSeeder::class);
    }
}
