<?php

declare(strict_types=1);

use App\Http\Controllers\API\APIController;
use App\Http\Controllers\API\CidadaoController;
use Illuminate\Support\Facades\Route;

Route::get('homepage', [APIController::class, 'homepage']);
Route::get('cidadaos', [CidadaoController::class, 'index']);
Route::get('cidadao/{uuid}', [CidadaoController::class, 'show']);
