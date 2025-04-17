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
        ContactoTipo::create(['tipo' => 'Website']);
        ContactoTipo::create(['tipo' => 'Email']);
        ContactoTipo::create(['tipo' => 'Telefone']);
        ContactoTipo::create(['tipo' => 'Fax']);
        ContactoTipo::create(['tipo' => 'X', 'description' => 'Redes Sociais',
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
        ContactoTipo::create(['tipo' => 'Facebook', 'description' => 'Facebook',
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
        ContactoTipo::create(['tipo' => 'Instagram', 'description' => 'Instagram',
            'params' => json_encode([
                'background' => [
                    'hex' => '#E4405F',
                    'bootstrap' => 'instagram',
                ],
                'color' => [
                    'hex' => '#FFFFFF',
                    'bootstrap' => 'white',
                ],
                'icon' => 'fa fa-instagram',
            ]),
        ]);
        ContactoTipo::create(['tipo' => 'Youtube', 'description' => 'Youtube',
            'params' => json_encode([
                'background' => [
                    'hex' => '#FF0000',
                    'bootstrap' => 'Youtube',
                ],
                'color' => [
                    'hex' => '#FFFFFF',
                    'bootstrap' => 'white',
                ],
                'icon' => 'fa fa-youtube',
            ]),
        ]);
    }
}
