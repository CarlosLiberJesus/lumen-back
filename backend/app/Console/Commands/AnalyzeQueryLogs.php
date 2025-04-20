<?php

declare(strict_types=1);

namespace App\Console\Commands;

use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

final class AnalyzeQueryLogs extends Command
{
    protected $signature = 'logs:analyze-queries {--days=1}';

    protected $description = 'Analyze query logs and show statistics';

    public function handle(): int
    {
        $days = $this->option('days');
        $logDir = storage_path('logs');

        // Create logs directory if it doesn't exist
        if (! File::exists($logDir)) {
            File::makeDirectory($logDir, 0755, true);
        }

        // Get all query log files for the specified days
        $logFiles = collect();
        for ($i = 0; $i <= $days; $i++) {
            $date = Carbon::now()->subDays($i)->format('Y-m-d');
            $logPath = storage_path(sprintf('logs/queries-%s.log', $date));
            if (File::exists($logPath)) {
                $logFiles->push($logPath);
            }
        }

        if ($logFiles->isEmpty()) {
            $this->warn('No query logs found for the last '.$days.' day(s)');
            $this->info('Logs should appear in: '.storage_path('logs/queries-YYYY-MM-DD.log'));

            return 1;
        }

        $logs = collect();

        // Process all log files
        foreach ($logFiles as $logPath) {
            $fileContents = collect(file($logPath));
            $logs = $logs->merge(
                $fileContents->filter(fn ($line): bool => str_contains($line, '"time":'))
                    ->map(function ($line): array {
                        $data = json_decode($line, true);

                        return [
                            'sql' => $data['sql'] ?? '',
                            'time' => $data['time'] ?? 0,
                            'datetime' => $data['datetime'] ?? '',
                            'connection' => $data['connection'] ?? 'default',
                        ];
                    })
            );
        }

        if ($logs->isEmpty()) {
            $this->warn('No query data found in the logs');

            return 1;
        }

        $this->info('Query Log Analysis:');
        $this->table(
            ['Metric', 'Value'],
            [
                ['Total Queries', $logs->count()],
                ['Average Time (ms)', round($logs->avg('time'), 2)],
                ['Max Time (ms)', $logs->max('time')],
                ['Slow Queries (>1s)', $logs->where('time', '>', 1000)->count()],
                ['Log Files Analyzed', $logFiles->count()],
            ]
        );

        // Show top 5 slowest queries
        $this->info("\nTop 5 Slowest Queries:");
        $slowest = $logs->sortByDesc('time')->take(5);
        $this->table(
            ['Query', 'Time (ms)', 'DateTime', 'Connection'],
            $slowest->map(fn ($q): array => [
                mb_substr((string) $q['sql'], 0, 100).(mb_strlen((string) $q['sql']) > 100 ? '...' : ''),
                $q['time'],
                $q['datetime'],
                $q['connection'],
            ])
        );

        return 0;
    }
}
