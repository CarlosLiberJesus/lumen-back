<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Exception;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Symfony\Component\DomCrawler\Crawler;

final class ScrapeGovernmentDocuments extends Command
{
    private const BASE_URL = 'https://www.historico.portugal.gov.pt';

    private const DOCUMENTS_PATH = '/pt/o-governo/arquivo-historico/governos-constitucionais/gc%s/documentos-oficiais.aspx';

    private const THEMES_PATH = '/pt/o-governo/arquivo-historico/governos-constitucionais/gc%s/os-temas.aspx';

    protected $signature = 'scrape:government-documents {government=19}';

    protected $description = 'Scrape government official documents and themes from historico.portugal.gov.pt';

    public function handle(): int
    {
        $government = $this->argument('government');

        try {
            // First scrape official documents
            $documentsUrl = self::BASE_URL.sprintf(self::DOCUMENTS_PATH, $government);
            $this->info(sprintf('Fetching official documents for government %s from %s', $government, $documentsUrl));

            $client = new Client(['timeout' => 30]);
            $response = $client->get($documentsUrl);
            $crawler = new Crawler($response->getBody()->getContents());

            $documents = $this->extractDocumentsTemplate($crawler);

            $outputPath = storage_path(sprintf('app/government_%s_official_documents.json', $government));
            file_put_contents($outputPath, json_encode($documents, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
            $this->info(sprintf('Official documents data saved to: %s', $outputPath));

            // Then scrape themes
            $themesUrl = self::BASE_URL.sprintf(self::THEMES_PATH, $government);
            $this->info(sprintf('Fetching themes for government %s from %s', $government, $themesUrl));

            $response = $client->get($themesUrl);
            $crawler = new Crawler($response->getBody()->getContents());

            $themes = $this->extractThemesTemplate($crawler);

            $outputPath = storage_path(sprintf('app/government_%s_themes.json', $government));
            file_put_contents($outputPath, json_encode($themes, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
            $this->info(sprintf('Themes data saved to: %s', $outputPath));

            return Command::SUCCESS;
        } catch (Exception $exception) {
            $this->error('Error fetching data: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function extractDocumentsTemplate(Crawler $crawler): array
    {
        $documents = [];

        $crawler->filter('.dynamicHomepageFeed.genericList li')->each(function (Crawler $li) use (&$documents): void {
            $titleLink = $li->filter('h3.mainForecolor a');
            if ($titleLink->count() === 0) {
                return;
            }

            $title = mb_trim($titleLink->text());
            $href = $titleLink->attr('href');

            $documents[] = [
                'nome' => $title,
                'anexo_tipo_id' => 4, // You might want to adjust this ID based on your anexo_tipos table
                'anexo' => self::BASE_URL.$href,
            ];
        });

        return $documents;
    }

    private function extractThemesTemplate(Crawler $crawler): array
    {
        $themes = [];

        $crawler->filter('.linksWrap ul li')->each(function (Crawler $li) use (&$themes): void {
            $span = $li->filter('span');
            $link = $li->filter('a');

            if ($span->count() === 0 || $link->count() === 0) {
                return;
            }

            $title = mb_trim($span->text());
            $href = $link->attr('href');

            $themes[] = [
                'nome' => $title,
                'anexo_tipo_id' => 5, // You might want to adjust this ID based on your anexo_tipos table
                'anexo' => self::BASE_URL.$href,
            ];
        });

        return $themes;
    }
}
