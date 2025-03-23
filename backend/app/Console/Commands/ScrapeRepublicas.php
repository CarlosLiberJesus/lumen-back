<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\AnexoTipo;
use App\Models\Republica;
use App\Models\RepublicaAnexo;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Support\Str;

final class ScrapeRepublicas extends Command
{
    protected $signature = 'scrape:republicas';

    protected $description = 'Scrape republic data from Wikipedia';

    public function handle(): void
    {
        try {
            $republicas = [
                [
                    'nome' => 'Ditadura Militar e Estado Novo',
                    'inicio' => '1926-05-28',
                    'fim' => '1974-04-25',
                    'sinopse' => 'Regime político autoritário que governou Portugal entre 1926 e 1974.',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                ],
                [
                    'nome' => 'Monarquia Absoluta',
                    'inicio' => '1736-01-01',
                    'fim' => '1822-09-24',
                    'sinopse' => 'Regime monárquico absoluto que governou Portugal até 1822.',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                ],
                [
                    'nome' => 'Monarquia Constitucional',
                    'inicio' => '1822-09-24',
                    'fim' => '1910-10-05',
                    'sinopse' => 'Regime monárquico constitucional que governou Portugal entre 1822 e 1910.',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                ],
                [
                    'nome' => 'Primeira República',
                    'inicio' => '1910-10-05',
                    'fim' => '1926-05-28',
                    'sinopse' => 'Regime democrático parlamentar que governou Portugal entre 1910 e 1926.',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                ],
                [
                    'nome' => 'Terceira República',
                    'inicio' => '1974-04-25',
                    'fim' => null,
                    'sinopse' => 'Atual regime democrático parlamentar de Portugal, iniciado após a Revolução dos Cravos.',
                    'image_url' => 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/1200px-Flag_of_Portugal.svg.png',
                ],
            ];

            // Certifique-se de que $anexoTipoWikipedia está definido
            $anexoTipoWikipedia = AnexoTipo::where('tipo', 'profile')->firstOrFail();

            foreach ($republicas as $republicaData) {
                $republica = Republica::firstOrCreate(
                    ['nome' => $republicaData['nome']],
                    [
                        'uuid' => Str::uuid(),
                        'inicio' => $republicaData['inicio'],
                        'fim' => $republicaData['fim'],
                        'sinopse' => $republicaData['sinopse'],
                    ]
                );

                RepublicaAnexo::firstOrCreate(
                    [
                        'republica_id' => $republica->id,
                        'anexo' => $republicaData['image_url'],
                    ],
                    [
                        'uuid' => Str::uuid(),
                        'anexo_tipo_id' => $anexoTipoWikipedia->id,
                        'nome' => 'Bandeira da '.$republicaData['nome'],
                        'descricao' => 'Bandeira ou símbolo da '.$republicaData['nome'],
                    ]
                );

                $this->info(sprintf('Inserted república: %s (%s–%s)', $republicaData['nome'], $republicaData['inicio'], $republicaData['fim']));
            }

            $this->info('Completed scraping repúblicas.');

        } catch (Exception $exception) {
            $this->error('Error occurred: '.$exception->getMessage());
        }
    }
}
