<?php

declare(strict_types=1);

namespace App\Services;

use App\Helpers\StringHelper;
use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

final class QueryLogger
{
    /** @var array<int, array<string, mixed>> */
    private static array $queries = [];

    private static float $startTime;

    public static function enable(): void
    {
        self::$queries = [];
        self::$startTime = microtime(true);

        DB::listen(function (QueryExecuted $query): void {
            $sql = $query->sql;
            /** @var array<int|string, mixed> $bindings */
            $bindings = $query->bindings;
            $time = $query->time;

            // Replace bindings in SQL
            foreach ($bindings as $binding) {
                $safeValue = StringHelper::toSafeString($binding);
                $value = is_numeric($binding)
                    ? $safeValue
                    : "'".$safeValue."'";

                $sql = (string) preg_replace('/\?/', $value, $sql, 1);
            }

            $logData = [
                'sql' => $sql,
                'time' => $time,
                'datetime' => now()->toDateTimeString(),
                'connection' => $query->connectionName,
            ];

            self::$queries[] = $logData;

            // Always log the query to the daily file
            Log::channel('queries')->info('SQL Query', $logData);

            // Log slow queries (> 1 second) with warning level
            if ($time > 1000) {
                Log::channel('queries')->warning('Slow Query Detected', $logData);
            }
        });
    }

    public static function disable(): void
    {
        DB::disableQueryLog();
    }

    /**
     * @return array<int, array<string, mixed>>
     */
    public static function getQueries(): array
    {
        return self::$queries;
    }

    public static function getExecutionTime(): float
    {
        return microtime(true) - self::$startTime;
    }

    /**
     * @return array<string, int|float>
     */
    public static function getSummary(): array
    {
        return [
            'total_queries' => count(self::$queries),
            'total_time' => array_sum(array_column(self::$queries, 'time')),
            'average_time' => self::$queries !== []
                ? array_sum(array_column(self::$queries, 'time')) / count(self::$queries)
                : 0,
            'execution_time' => self::getExecutionTime(),
        ];
    }
}
