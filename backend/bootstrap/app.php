<?php

declare(strict_types=1);

use App\Http\Middleware\ApiMiddleware;
use App\Models\Log;
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
        if ($environment === 'local') {
            error_log('--- CATCH APP-Exception ---');
            error_log(json_encode($exceptions, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
            error_log('###########################');
        }

        $exceptions->render(function (Throwable $e, $request) {
            $start_time = microtime(true); // Captura o tempo inicial
            $environment = config('app.env');
            $url = '/'.$request->path();

            $exceptionData = [
                'message' => $e->getMessage(),
                'file' => basename($e->getFile()),
                'line' => $e->getLine(),
            ];

            $response = [
                'code' => $e->getCode() ?: 500,
                'exception' => $exceptionData,
                'data' => null,
            ];

            // Log do erro
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
            ];
            Log::create($logRequest);

            if ($environment === 'local') {
                error_log('--- CATCH APP-Exception ---');
                error_log(json_encode($response, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE));
                error_log('###########################');
            }

            return response()->json($response, $response['code'])
                ->header('Access-Control-Allow-Origin', '*')
                ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, App-Uuid');
        });
    })->create();
