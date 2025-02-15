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
        ContactoTipo::create(['nome' => 'X', 'description' => 'Redes Sociais',
            'params' => json_encode([
                'background' => [
                    'hex' => '#000000',
                    'bootstrap' => 'black',
                ],
                'color' => [
                    'hex' => '#FFFFFF',
                    'bootstrap' => 'white',
                ],
                'icon' => 'fa fa-x',
            ]),
        ]);
        ContactoTipo::create(['nome' => 'Facebook', 'description' => 'Facebook',
            'params' => json_encode([
                'background' => [
                    'hex' => '#3b5998',
                    'bootstrap' => 'facebook',
                ],
                'color' => [
                    'hex' => '#FFFFFF',
                    'bootstrap' => 'white',
                ],
                'icon' => 'fa fa-facebook',
            ]),
        ]);
    }
}
