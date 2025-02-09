<?php

declare(strict_types=1);

namespace Database\Seeders;

use App\Models\ContactoTipo;
use Illuminate\Database\Seeder;

final class ContactoTiposSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ContactoTipo::create(['nome' => 'Website']);
        ContactoTipo::create(['nome' => 'Email']);
        ContactoTipo::create(['nome' => 'Telefone']);
        ContactoTipo::create(['nome' => 'Redes Sociais']);
        ContactoTipo::create(['nome' => 'Fax']);
    }
}
