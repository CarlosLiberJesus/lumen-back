<?php

declare(strict_types=1);

use App\Http\Middleware\ApiMiddleware;
use App\Models\Log;
use App\Services\QueryLogger;
use Illuminate\Database\QueryException;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->api(prepend: [
            ApiMiddleware::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        $environment = config('app.env');

        $exceptions->render(function (Throwable $e, $request) {
            $start_time = microtime(true);
            $environment = config('app.env');
            $url = '/'.$request->path();

            // Enhanced exception data
            $exceptionData = [
                'message' => $e->getMessage(),
                'code' => $e->getCode(),
                'file' => basename($e->getFile()),
                'line' => $e->getLine(),
                'class' => $e::class,
                'sql' => $e instanceof QueryException ? $e->getSql() : null,
                'bindings' => $e instanceof QueryException ? $e->getBindings() : null,
                'trace' => $environment === 'local' ? array_slice($e->getTrace(), 0, 3) : null,
            ];

            $response = [
                'code' => $e->getCode() ?: 500,
                'exception' => $exceptionData,
                'data' => null,
            ];

            // Enhanced logging
            $logRequest = [
                'user_id' => auth()->user()?->getAuthIdentifier(),
                'aplicacao_id' => $request->header('App-Uuid'),
                'method' => $request->method(),
                'code' => $response['code'],
                'url' => $url,
                'message' => 'CATCH APP-Exception',
                'params' => json_encode($request->except('password')),
                'reply' => json_encode($exceptionData),
                'time' => round((microtime(true) - $start_time) * 1000),
                'query_log' => QueryLogger::getQueries(), // Add recent queries
            ];

            Log::create($logRequest);

            if ($environment === 'local') {
                error_log('--- CATCH APP-Exception ---');
                error_log(json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
                error_log('--- Recent Queries ---');
                error_log(json_encode(QueryLogger::getSummary(), JSON_PRETTY_PRINT));
                error_log('###########################');
            }

            return response()->json($response, $response['code'])
                ->header('Access-Control-Allow-Origin', '*')
                ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, App-Uuid');
        });
    })->create();
