<?php

declare(strict_types=1);

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\View;

final class PageController extends Controller
{
    public function welcome(): View
    {
        return view('welcome');
    }
}
