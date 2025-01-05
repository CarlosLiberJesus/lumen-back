<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;

class PageController extends Controller
{
    public function wellcome()
    {
        return view('wellcome');
    }
}
