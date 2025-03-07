<?php

declare(strict_types=1);

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

final class APIController extends Controller
{
    /**
     * @return array<string, string>
     */
    public function homepage(Request $request): array
    {
        return ['version' => '1.0']; // Middleware formata como IApiResponse
    }
}
