<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Exception;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Symfony\Component\DomCrawler\Crawler;

final class ScrapeGovernmentCommunications extends Command
{
    private const BASE_URL = 'https://www.historico.portugal.gov.pt';

    private const COMMUNICATIONS_PATH = '/pt/o-governo/arquivo-historico/governos-constitucionais/gc%s/comunicados-cm.aspx';

    protected $signature = 'scrape:government-communications {government=12}';

    protected $description = 'Scrape government council communications from historico.portugal.gov.pt';

    public function handle(): int
    {
        $government = $this->argument('government');
        $url = self::BASE_URL.sprintf(self::COMMUNICATIONS_PATH, $government);

        $this->info(sprintf('Fetching communications for government %s from %s', $government, $url));

        try {
            $client = new Client(['timeout' => 30]);
            $response = $client->get($url);
            $crawler = new Crawler($response->getBody()->getContents());

            $yearLinks = $this->extractYearLinks($crawler);

            $this->info('Year links found:');
            $this->line(json_encode($yearLinks, JSON_PRETTY_PRINT));

            // Process each year's communications
            foreach ($yearLinks as $yearData) {
                $this->info(sprintf('Processing year: %s', $yearData['year']));
                $allCommunications = [];

                // Get first page
                $yearUrl = self::BASE_URL.$yearData['link'];
                $response = $client->get($yearUrl);
                $yearCrawler = new Crawler($response->getBody()->getContents());

                // Try first template
                $communications = $this->extractCommunications($yearCrawler);

                // If no communications found, try alternative template
                if ($communications === []) {
                    $this->info('No communications found with primary template, trying alternative...');
                    $communications = $this->extractAlternativeCommunications($yearCrawler);
                }

                $allCommunications = array_merge($allCommunications, $communications);

                // Only try pagination if using primary template
                if ($communications !== []) {
                    // Get pagination links
                    $pageLinks = $this->extractPaginationLinks($yearCrawler);

                    // Process additional pages if they exist
                    foreach ($pageLinks as $pageUrl) {
                        $this->info(sprintf('Processing additional page: %s', $pageUrl));

                        $response = $client->get(self::BASE_URL.$pageUrl);
                        $pageCrawler = new Crawler($response->getBody()->getContents());

                        $pageCommunications = $this->extractCommunications($pageCrawler);
                        $allCommunications = array_merge($allCommunications, $pageCommunications);

                        // Add small delay between page requests
                        sleep(1);
                    }
                }

                $this->info(sprintf('Found total %d communications for year %s:', count($allCommunications), $yearData['year']));
                $outputPath = storage_path(sprintf('app/government_%s_communications_%s.json', $government, $yearData['year']));
                file_put_contents($outputPath, json_encode($allCommunications, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
                $this->info(sprintf('Communications data for year %s saved to: %s', $yearData['year'], $outputPath));

                // Add small delay between years
                sleep(1);
            }

            return Command::SUCCESS;
        } catch (Exception $exception) {
            $this->error('Error fetching data: '.$exception->getMessage());

            return Command::FAILURE;
        }
    }

    private function extractPaginationLinks(Crawler $crawler): array
    {
        $links = [];

        $crawler->filter('.paginator ul li a')->each(function (Crawler $a) use (&$links): void {
            $href = $a->attr('href');
            // Only add if it's a page link (contains ?p=)
            if (str_contains($href, '?p=')) {
                $links[] = $href;
            }
        });

        // Remove duplicates and return
        return array_unique($links);
    }

    private function extractYearLinks(Crawler $crawler): array
    {
        $links = [];

        $crawler->filter('.linksWrap ul li')->each(function (Crawler $li) use (&$links): void {
            $yearText = mb_trim($li->filter('span')->first()->text());
            $href = $li->filter('a')->attr('href');

            // Extract year from text (e.g., "Comunicados do Conselho de Ministros do XII Governo - 1995")
            if (preg_match('/- (\d{4})$/', $yearText, $matches)) {
                $year = $matches[1];

                $links[] = [
                    'year' => $year,
                    'text' => $yearText,
                    'link' => $href,
                ];
            }
        });

        // Sort by year descending (most recent first)
        usort($links, fn ($a, $b): int => $b['year'] <=> $a['year']);

        return $links;
    }

    private function extractCommunications(Crawler $crawler): array
    {
        $communications = [];

        $crawler->filter('.dynamicHomepageFeed.genericList li')->each(function (Crawler $li) use (&$communications): void {
            $titleLink = $li->filter('h3.mainForecolor a');
            if ($titleLink->count() === 0) {
                return;
            }

            $title = mb_trim($titleLink->text());
            $href = $titleLink->attr('href');

            // Extract date from link (e.g., "19951012" from ".../19951012.aspx")
            if (preg_match('/\/(\d{8})\.aspx$/', $href, $matches)) {
                $dateString = $matches[1];
                $formattedDate = sprintf(
                    '%s-%s-%s',
                    mb_substr($dateString, 0, 4),
                    mb_substr($dateString, 4, 2),
                    mb_substr($dateString, 6, 2)
                );
            } else {
                $formattedDate = null;
            }

            $communications[] = [
                'nome' => $title,
                'anexo_tipo_id' => 3,
                'anexo' => self::BASE_URL.$href,
            ];
        });

        return $communications;
    }

    private function extractAlternativeCommunications(Crawler $crawler): array
    {
        $communications = [];

        $crawler->filter('.linksWrap ul li')->each(function (Crawler $li) use (&$communications): void {
            $span = $li->filter('span');
            $link = $li->filter('a');

            if ($span->count() === 0 || $link->count() === 0) {
                return;
            }

            $title = mb_trim($span->text());
            $href = $link->attr('href');

            // Extract date from link (e.g., "19991008" from ".../19991008.aspx")
            if (preg_match('/\/(\d{8})\.aspx$/', $href, $matches)) {
                $dateString = $matches[1];
                $formattedDate = sprintf(
                    '%s-%s-%s',
                    mb_substr($dateString, 0, 4),
                    mb_substr($dateString, 4, 2),
                    mb_substr($dateString, 6, 2)
                );
            } else {
                $formattedDate = null;
            }

            $communications[] = [
                'nome' => $title,
                'anexo_tipo_id' => 3,
                'anexo' => self::BASE_URL.$href,
            ];
        });

        return $communications;
    }
}
