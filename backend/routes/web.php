<?php

declare(strict_types=1);

use App\Http\Controllers\EmailController;
use App\Http\Controllers\Web\NewsLetterUserController;
use App\Http\Controllers\Web\PageController;
use Illuminate\Support\Facades\Route;

Route::get('/', [PageController::class, 'welcome']);
Route::get('newsletter', [NewsLetterUserController::class, 'newsletter']);
Route::post('newsletter', [NewsLetterUserController::class, 'submitNewsletter'])->name('form.subscribe.newsletter');
Route::post('email/footer', [EmailController::class, 'templateFooterEmail'])->name('email.from.footer');

Route::fallback(fn () => response()->view('web.errors.404', [], 404));
