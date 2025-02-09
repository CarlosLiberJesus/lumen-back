<?php

declare(strict_types=1);

namespace App\Http\Controllers\Web\Private;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\View;

final class DashboardController extends Controller
{
    public function dashboard(): View
    {
        $breadcrumbs = [
            ['url' => '#', 'label' => 'Ínicio'],
        ];

        $title = 'Api BeWhyOrg Dashboard';

        return view('private.dashboard', ['breadcrumbs' => $breadcrumbs, 'title' => $title]);
    }
}
