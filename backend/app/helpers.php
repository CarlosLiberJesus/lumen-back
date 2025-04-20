<?php

declare(strict_types=1);

use App\Helpers\StringHelper;

if (! function_exists('title_pt')) {
    function title_pt(string $text): string
    {
        return StringHelper::titlePt($text);
    }
}
