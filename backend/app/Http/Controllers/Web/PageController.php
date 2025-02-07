<?php

declare(strict_types=1);

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\View;

final class PageController extends Controller
{
    public function welcome(): View
    {
        $breadcrumbs = [
            ['url' => '#', 'label' => 'Ínicio'],
        ];

        $title = 'Api BeWhyOrg';

        return view('welcome', ['breadcrumbs' => $breadcrumbs, 'title' => $title]);
    }
}
