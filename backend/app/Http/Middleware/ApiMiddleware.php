<?php

declare(strict_types=1);

namespace App\Http\Middleware;

use App\Models\Aplicacao;
use App\Models\Log;
use Closure;
use Exception;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

final class ApiMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $environment = config('app.env');
        $start_time = microtime(true);
        $url = '/'.$request->path();

        if ($request->isMethod('OPTIONS')) {
            return response('', 200)
                ->header('Access-Control-Allow-Origin', '*')
                ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, App-Uuid');
        }

        if (!$this->checkIncomingRequest($request)) {
            if ($environment === 'local') {
                error_log('##################################'.PHP_EOL.'######### Check App_Key ##########'.PHP_EOL.'##################################');
            }

            return $this->errorResponse(500, 'Verifique a especificação fornecida pela equipa de desenvolvimento.');
        }

        try {
            if ($environment === 'local') {

                error_log('---  Requested data @'.$url.'---');
                $requestData = json_encode($request->all(), JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
                if ($requestData === false) {
                    error_log('Failed to encode request data');
                } else {
                    error_log($requestData);
                }

                error_log('##################################');
            }

            $response = $next($request);

            $user = auth()->user();
            $user_id = $user ? $user->getAuthIdentifier() : null;
            if ($user) {
                $user->touch();
            }

            $code = $response->getStatusCode();
            $responseContent = $response->getContent();
            $data = null;
            $exception = null;
            if ($responseContent) {
                $data = $code === 200 ? json_decode($responseContent, true) : null;
                $exception = $code !== 200 ? json_decode($responseContent, true) : null;

                if (is_array($exception) && isset($exception['trace'])) {
                    unset($exception['trace']);
                }
            }

            $params = $code !== 200 ? json_encode($request->except('password')) : null;
            $reply = $exception ? json_encode($exception) : null;

            $logRequest = [
                'user_id' => $user_id,
                'aplicacao_id' => $request->header('App-Uuid'),
                'method' => $request->method(),
                'code' => $code,
                'url' => $url,
                'message' => $code === 200 ? null : 'ERROR.'.$code,
                'params' => $params,
                'reply' => $reply,
                'time' => round((microtime(true) - $start_time) * 1000),
            ];
            Log::create($logRequest);

            $finalResponse = $code !== 200 ? $exception : ['code' => $code, 'data' => $data];
            if ($environment === 'local') {
                error_log('---  Resposta Servidor  ---');
                $finalResponseData = json_encode($finalResponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
                if ($finalResponseData === false) {
                    error_log('Failed to encode final response data');
                } else {
                    error_log($finalResponseData);
                }

                error_log('###########################');
            }

            return response()->json($finalResponse, $code)
                ->header('Access-Control-Allow-Origin', '*')
                ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
                ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, App-Uuid');

        } catch (Exception $exception) {
            $exceptionData = [
                'message' => $exception->getMessage(),
                'file' => basename($exception->getFile()),
                'line' => $exception->getLine(),
            ];

            $logRequest = [
                'user_id' => auth()->user()?->getAuthIdentifier(),
                'aplicacao_id' => $request->header('App-Uuid'),
                'method' => $request->method(),
                'code' => 500,
                'url' => $url,
                'message' => 'CATCH API-Middleware',
                'params' => json_encode($request->except('password')),
                'reply' => json_encode($exceptionData),
                'time' => round((microtime(true) - $start_time) * 1000),
            ];
            Log::create($logRequest);

            $finalResponse = ['code' => 500, 'exception' => $exceptionData];
            if ($environment === 'local') {
                error_log('---  Resposta Error Servidor  ---');
                $finalResponseData = json_encode($finalResponse, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
                if ($finalResponseData === false) {
                    error_log('Failed to encode final response data');
                } else {
                    error_log($finalResponseData);
                }

                error_log('###########################');
            }

            return $this->errorResponse(500, $exception->getMessage(), $exceptionData);
        }
    }

    private function checkIncomingRequest(Request $request): bool
    {
        $valid = true;
        if (!$request->header('Content-Type') || $request->header('Content-Type') !== 'application/json') {
            $valid = false;
        }

        if (!$request->header('App-Uuid')) {
            $valid = false;
        }

        $application = Aplicacao::where('uuid', $request->header('App-Uuid'))->first();
        if (!$application) {
            return false;
        }

        return $valid;
    }

    /**
     * @param  array<string, mixed>  $exceptionData
     */
    private function errorResponse(int $code, string $message, array $exceptionData = []): Response
    {
        $exception = [
            'message' => $message,
            'file' => $exceptionData['file'] ?? 'ApiMiddleware',
            'line' => $exceptionData['line'] ?? null,
        ];

        $response = [
            'code' => $code,
            'exception' => $exception,
            'data' => null,
        ];

        return response()->json($response, $code)
            ->header('Access-Control-Allow-Origin', '*')
            ->header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS')
            ->header('Access-Control-Allow-Headers', 'Content-Type, Authorization, App-Uuid');
    }
}
