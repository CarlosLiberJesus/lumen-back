<?php

declare(strict_types=1);

use App\Http\Controllers\Auth\Web\LoginController;
use App\Http\Controllers\Web\PageController;
// use App\Http\Controllers\EmailController;
// use App\Http\Controllers\Web\Public\NewsLetterUserController;
use App\Http\Controllers\Web\Private\DashboardController;
use Illuminate\Support\Facades\Route;

Route::get('/', [PageController::class, 'welcome']);
// Route::get('newsletter', [NewsLetterUserController::class, 'newsletter']);
// Route::post('newsletter', [NewsLetterUserController::class, 'submitNewsletter'])->name('form.subscribe.newsletter');
// Route::post('email/footer', [EmailController::class, 'templateFooterEmail'])->name('email.from.footer');

Route::get('login', [LoginController::class, 'loginPane']);
Route::post('login', [LoginController::class, 'login'])->name('web.login');

Route::middleware(['auth'])->group(function (): void {
    Route::get('dashboard', [DashboardController::class, 'dashboard']);
});

Route::fallback(fn () => response()->view('errors.404', [], 404));
