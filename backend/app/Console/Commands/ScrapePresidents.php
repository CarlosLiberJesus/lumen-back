<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\Cidadao;
use App\Models\CidadaoCargo;
use App\Models\Instituicao;
use App\Models\InstituicaoCargo;
use App\Models\InstituicaoPresidencial;
use App\Models\Presidencial;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Illuminate\Support\Str;
use Symfony\Component\DomCrawler\Crawler;

final class ScrapePresidents extends Command
{
    protected $signature = 'scrape:presidents';

    protected $description = 'Scrape Portuguese presidents from Wikipedia';

    public function handle(): void
    {
        $client = new Client();
        $response = $client->get('https://en.wikipedia.org/wiki/List_of_presidents_of_Portugal');
        $crawler = new Crawler($response->getBody()->getContents());

        $presidencia = Instituicao::firstOrCreate(
            ['nome' => 'Presidência da República'],
            ['uuid' => Str::uuid()]
        );

        $crawler->filter('table.wikitable tr')->each(function (Crawler $row) use ($presidencia): void {
            $columns = $row->filter('td');
            if ($columns->count() < 4) {
                return;
            } // Skip headers/empty rows

            $name = mb_trim($columns->eq(1)->text()); // President name
            $start = $this->parseDate($columns->eq(2)->text()); // Term start
            $end = $this->parseDate($columns->eq(3)->text()); // Term end

            // Citizen
            $cidadao = Cidadao::firstOrCreate(
                ['nome' => $name],
                ['uuid' => Str::uuid()]
            );

            // Presidential term
            $presidencial = Presidencial::create([
                'uuid' => Str::uuid(),
                'republica_id' => 3, // Adjust based on date
                'posse' => $start,
                'termino' => $end,
            ]);

            // Institution term
            $instPresidencial = InstituicaoPresidencial::create([
                'nome' => 'Presidência Constitucional',
                'instituicao_id' => $presidencia->id,
                'presidencial_id' => $presidencial->id,
            ]);

            // Role
            $cargo = InstituicaoCargo::create([
                'uuid' => Str::uuid(),
                'tipo' => 'instituicao_presidencial',
                'cargo' => 'Presidente da República',
                'instituicao_id' => $instPresidencial->id,
            ]);

            // Assign role
            CidadaoCargo::create([
                'cidadao_id' => $cidadao->id,
                'cargo_id' => $cargo->id,
                'inicio' => $start,
                'fim' => $end,
            ]);

            $this->info(sprintf('Added %s: %s to %s', $name, $start, $end));
        });
    }

    private function parseDate(string $text): ?string
    {
        // Rough date parsing—tweak for Wikipedia’s format (e.g., "24 August 1911")
        $timestamp = strtotime((string) preg_replace('/\s+/', ' ', mb_trim($text)));

        return $timestamp !== false ? date('Y-m-d', $timestamp) : null;
    }
}
