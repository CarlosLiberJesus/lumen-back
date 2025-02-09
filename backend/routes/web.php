<?php

declare(strict_types=1);

use App\Http\Controllers\Auth\Web\WebLoginController;
use App\Http\Controllers\Web\PageController;
// use App\Http\Controllers\EmailController;
// use App\Http\Controllers\Web\Public\NewsLetterUserController;
use App\Http\Controllers\Web\Private\DashboardController;
use Illuminate\Support\Facades\Route;

Route::get('/', [PageController::class, 'welcome']);
// Route::get('newsletter', [NewsLetterUserController::class, 'newsletter']);
// Route::post('newsletter', [NewsLetterUserController::class, 'submitNewsletter'])->name('form.subscribe.newsletter');
// Route::post('email/footer', [EmailController::class, 'templateFooterEmail'])->name('email.from.footer');

Route::get('login', [WebLoginController::class, 'loginPane'])->name('login');
Route::post('login', [WebLoginController::class, 'login'])->name('web.login');
Route::post('logout', [WebLoginController::class, 'logout'])->name('web.logout');

Route::middleware(['auth'])->group(function (): void {
    Route::get('dashboard', [DashboardController::class, 'dashboard']);
});

Route::fallback(fn () => response()->view('errors.404', [], 404));
