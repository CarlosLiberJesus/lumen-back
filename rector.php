<?php

declare(strict_types=1);

use Rector\Config\RectorConfig;
use Rector\Set\ValueObject\LevelSetList;
use Rector\Set\ValueObject\SetList;

return static function (RectorConfig $rectorConfig): void {
    $rectorConfig->paths([
        __DIR__.'/backend',
    ]);

    // Exclude vendor directory and specific files
    $rectorConfig->skip([
        __DIR__.'/backend/vendor/*',
        __DIR__.'/backend/database/seeders/*',
        __DIR__.'/backend/app/Console/Commands/*',
        // __DIR__ . '/backend/resources/views/*.php',
        __DIR__.'/backend/storage/*',
        __DIR__.'/backend/bootstrap/cache/*',
        __DIR__.'/backend/_ide_*',
        __DIR__.'/backend/.phpstorm.meta.php',
    ]);

    $rectorConfig->sets([
        SetList::DEAD_CODE,
        SetList::EARLY_RETURN,
        SetList::TYPE_DECLARATION,
        SetList::CODE_QUALITY,
        SetList::CODING_STYLE,
        SetList::EARLY_RETURN,
        SetList::PRIVATIZATION,
        SetList::STRICT_BOOLEANS,
        LevelSetList::UP_TO_PHP_82,
    ]);

    // @deprecated $rectorConfig->withTimeout(600);
    // 10min
    $rectorConfig->parallel(600);

    // Set levels (Optional, based on your needs)
    //$rectorConfig->withSystemErrorsLimit(100);
    //$rectorConfig->withTypeCoverageLevel(0);
    //$rectorConfig->withDeadCodeLevel(0);
    //$rectorConfig->withCodeQualityLevel(0);
};
