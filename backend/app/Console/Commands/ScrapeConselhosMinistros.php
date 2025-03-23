<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\Governo;
use App\Models\Instituicao;
use App\Models\InstituicaoGoverno;
use App\Models\InstituicaoTipo;
use Illuminate\Console\Command;
use Illuminate\Support\Str;

final class ScrapeConselhosMinistros extends Command
{
    protected $signature = 'scrape:conselhos-ministros';

    protected $description = 'Create Conselho de Ministros entries and associate with governos';

    public function handle(): void
    {
        $this->info('Starting to create Conselho de Ministros entries...');

        // Check if we have governos (these should be created by a separate scraper)
        $governosCount = Governo::count();
        if ($governosCount === 0) {
            $this->error('No governos found in the database. Please run scrape:governos first.');

            return;
        }

        // Get or create the institution type
        $conselhoTipo = InstituicaoTipo::firstOrCreate(
            ['nome' => 'Conselho'],
            [
                'uuid' => Str::uuid(),
                'descricao' => 'Órgão colegial de decisão ou consultivo.',
            ]
        );

        // Create the main Conselho de Ministros institution (which is persistent over time)
        $conselhoDeMinistros = Instituicao::firstOrCreate(
            ['nome' => 'Conselho de Ministros'],
            [
                'uuid' => Str::uuid(),
                'instituicao_tipo_id' => $conselhoTipo->id,
                'fundacao' => '1736-01-01', // Approximate date based on historical context
                'dissolucao' => null,
                'sinopse' => 'Órgão colegial composto pelo Primeiro-Ministro e os ministros, e que constitui o núcleo essencial do Governo de Portugal.',
            ]
        );

        $this->info('Created/Retrieved main Conselho de Ministros institution.');

        // For each governo, create an instituicao_governo entry for Conselho de Ministros
        $count = 0;
        foreach (Governo::orderBy('inicio')->get() as $governo) {
            $instituicaoGoverno = InstituicaoGoverno::firstOrCreate(
                [
                    'instituicao_id' => $conselhoDeMinistros->id,
                    'governo_id' => $governo->id,
                ],
                [
                    'uuid' => Str::uuid(),
                    'nome' => 'Conselho de Ministros do '.$governo->nome,
                    'inicio' => $governo->inicio,
                    'fim' => $governo->fim,
                    'descricao' => 'Conselho de Ministros durante o governo '.$governo->nome,
                ]
            );

            $count++;
            $this->info('Associated Conselho de Ministros with governo: '.$governo->nome);
        }

        $this->info(sprintf('Completed creating %d Conselho de Ministros entries for different governos.', $count));
    }
}
