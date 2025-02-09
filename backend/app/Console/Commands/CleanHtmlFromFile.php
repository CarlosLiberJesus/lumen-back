<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Illuminate\Console\Command;

final class CleanHtmlFromFile extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clean:html {file}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clean HTML tags from a file and save the cleaned content';

    /**
     * Execute the console command.
     */
    public function handle(): int
    {
        $filePath = $this->argument('file');
        $fullPath = base_path($filePath);

        if (!file_exists($fullPath)) {
            $this->error('File not found: ' . $fullPath);

            return 1;
        }

        // Read the file content
        $content = file_get_contents($fullPath);

        // Strip HTML tags
        if ($content === false) {
            $this->error('Failed to read file content: ' . $fullPath);

            return 1;
        }

        $cleanedContent = strip_tags($content);

        // Save the cleaned content back to the same file
        file_put_contents($fullPath, $cleanedContent);

        $this->info('Cleaned content saved to: ' . $fullPath);

        return 0;
    }
}
