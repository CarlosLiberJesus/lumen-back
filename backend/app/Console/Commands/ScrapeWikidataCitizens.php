<?php

declare(strict_types=1);

namespace App\Console\Commands;

use App\Models\Cidadao;
use App\Models\CidadaoCargo;
use App\Models\Instituicao;
use App\Models\InstituicaoCargo;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Illuminate\Support\Str;

final class ScrapeWikidataCitizens extends Command
{
    protected $signature = 'scrape:wikidata-citizens {name}';

    protected $description = 'Scrape citizen data from Wikidata';

    public function handle(): void
    {
        $client = new Client();
        $name = $this->argument('name');

        $searchUrl = 'https://www.wikidata.org/w/api.php?action=wbsearchentities&search='.urlencode($name).'&language=pt&format=json';
        $searchResponse = $client->get($searchUrl);
        $searchData = json_decode($searchResponse->getBody(), true);

        if (empty($searchData['search'])) {
            $this->error('No results for '.$name);

            return;
        }

        $entityId = $searchData['search'][0]['id'];
        $entityUrl = sprintf('https://www.wikidata.org/wiki/Special:EntityData/%s.json', $entityId);
        $entityResponse = $client->get($entityUrl);
        $entityData = json_decode($entityResponse->getBody(), true)['entities'][$entityId];

        $claims = $entityData['claims'];
        $nome = $entityData['labels']['pt']['value'] ?? $name;
        $birth = $claims['P569'][0]['mainsnak']['datavalue']['value']['time'] ?? null;
        $death = $claims['P570'][0]['mainsnak']['datavalue']['value']['time'] ?? null;
        $sinopse = $entityData['descriptions']['pt']['value'] ?? null;

        $cidadao = Cidadao::firstOrCreate(
            ['nome' => $nome],
            [
                'uuid' => Str::uuid(),
                'nome_completo' => $nome,
                'data_nascimento' => $birth ? mb_substr((string) $birth, 1, 10) : null,
                'data_falecimento' => $death ? mb_substr((string) $death, 1, 10) : null,
                'sinopse' => $sinopse,
            ]
        );

        // Presidency setup (manual for now—expand later)
        $presidencia = Instituicao::firstOrCreate(['nome' => 'Presidência da República'], ['uuid' => Str::uuid()]);
        if ($nome === 'Teófilo Braga') {
            $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 3, 'posse' => '1910-10-05', 'termino' => '1911-08-24']);
            $instPres = InstituicaoPresidencial::create(['nome' => 'Governo Provisório', 'instituicao_id' => $presidencia->id, 'presidencial_id' => $presidencial->id]);
            $cargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente do Governo Provisório', 'instituicao_id' => $instPres->id]);
            CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $cargo->id, 'inicio' => '1910-10-05', 'fim' => '1911-08-24']);
        } elseif ($nome === 'Mário Soares') {
            $presidencial = Presidencial::create(['uuid' => Str::uuid(), 'republica_id' => 5, 'posse' => '1986-03-09', 'termino' => '1996-03-09']);
            $instPres = InstituicaoPresidencial::create(['nome' => 'Presidência Constitucional', 'instituicao_id' => $presidencia->id, 'presidencial_id' => $presidencial->id]);
            $cargo = InstituicaoCargo::create(['uuid' => Str::uuid(), 'tipo' => 'instituicao_presidencial', 'cargo' => 'Presidente da República', 'instituicao_id' => $instPres->id]);
            CidadaoCargo::create(['cidadao_id' => $cidadao->id, 'cargo_id' => $cargo->id, 'inicio' => '1986-03-09', 'fim' => '1996-03-09']);
        }

        $this->info(sprintf('Added %s with ID %s', $nome, $entityId));
    }

    /*
    public function handle(): void
    {
        $client = new Client();
        $query = $this->argument('name'); // e.g., "Carmona Rodrigues"

        // Search for entity
        $searchUrl = 'https://www.wikidata.org/w/api.php?action=wbsearchentities&search='.urlencode($query).'&language=pt&format=json';
        $searchResponse = $client->get($searchUrl);
        $searchData = json_decode($searchResponse->getBody(), true);

        if (empty($searchData['search'])) {
            $this->error('No results for '.$query);

            return;
        }

        $entityId = $searchData['search'][0]['id']; // e.g., Q10264417

        // Get detailed entity data
        $entityUrl = sprintf('https://www.wikidata.org/wiki/Special:EntityData/%s.json', $entityId);
        $entityResponse = $client->get($entityUrl);
        $entityData = json_decode($entityResponse->getBody(), true)['entities'][$entityId];

        // Extract data
        $claims = $entityData['claims'];
        $labels = $entityData['labels']['pt']['value'] ?? $query;
        $birth = $claims['P569'][0]['mainsnak']['datavalue']['value']['time'] ?? null; // Birth date
        $death = $claims['P570'][0]['mainsnak']['datavalue']['value']['time'] ?? null; // Death date
        $description = $entityData['descriptions']['pt']['value'] ?? null; // Image filename

        // Create citizen
        $cidadao = Cidadao::firstOrCreate(
            ['nome' => $labels],
            [
                'uuid' => Str::uuid(),
                'nome_completo' => $labels,
                'data_nascimento' => $birth ? mb_substr((string) $birth, 1, 10) : null,
                'data_falecimento' => $death ? mb_substr((string) $death, 1, 10) : null,
                'sinopse' => $description,
            ]
        );

        // Example: Extract positions held (P39)
        if (isset($claims['P39'])) {
            foreach ($claims['P39'] as $position) {
                $roleId = $position['mainsnak']['datavalue']['value']['id']; // e.g., Q1054923 (Mayor of Lisbon)
                $start = $position['qualifiers']['P580'][0]['datavalue']['value']['time'] ?? null;
                $end = $position['qualifiers']['P582'][0]['datavalue']['value']['time'] ?? null;

                // Fetch role label (simplified—could query Wikidata again)
                $cargo = InstituicaoCargo::firstOrCreate(
                    ['uuid' => Str::uuid()],
                    ['cargo' => 'Cargo from '.$roleId, 'tipo' => 'instituicao', 'instituicao_id' => 1] // Placeholder instituicao_id
                );

                CidadaoCargo::create([
                    'cidadao_id' => $cidadao->id,
                    'cargo_id' => $cargo->id,
                    'inicio' => $start ? mb_substr((string) $start, 1, 10) : null,
                    'fim' => $end ? mb_substr((string) $end, 1, 10) : null,
                ]);
            }
        }

        $this->info(sprintf('Added %s with ID %s', $labels, $entityId));
    }
    */
}
