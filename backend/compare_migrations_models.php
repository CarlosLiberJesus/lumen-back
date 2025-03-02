<?php

declare(strict_types=1);

require __DIR__.'/vendor/autoload.php';

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;

// Initialize Laravel application
function initializeLaravelApp(): void
{
    $app = require_once __DIR__.'/bootstrap/app.php';
    $app->make(Illuminate\Contracts\Console\Kernel::class)->bootstrap();
}

function getMigrationFiles(string $directory)
{
    return glob($directory.'/*.php');
}

function getModelFiles(string $directory)
{
    return glob($directory.'/*.php');
}

function getTableColumns($migrationFile)
{
    $content = file_get_contents($migrationFile);
    preg_match('/Schema::create\(\'(.*?)\',/', $content, $matches);
    $tableName = $matches[1] ?? null;

    if ($tableName !== null && $tableName !== '' && $tableName !== '0') {
        echo sprintf('Table name found: %s%s', $tableName, PHP_EOL);

        return Schema::getColumnListing($tableName);
    }

    return [];
}

function getModelAttributes($modelFile)
{
    require_once $modelFile;
    $className = 'App\\Models\\'.basename((string) $modelFile, '.php');
    $model = new $className;

    echo sprintf('Model class: %s%s', $className, PHP_EOL);

    return $model->getFillable();
}

function compareMigrationsWithModels(): void
{
    $migrationFiles = getMigrationFiles(__DIR__.'/database/migrations');
    getModelFiles(__DIR__.'/app/Models');

    foreach ($migrationFiles as $migrationFile) {
        echo 'Processing migration file: '.basename((string) $migrationFile)."\n";
        $tableColumns = getTableColumns($migrationFile);

        if (empty($tableColumns)) {
            echo 'No table columns found for migration file: '.basename((string) $migrationFile)."\n";

            continue;
        }

        // Ignore common columns
        $tableColumns = array_diff($tableColumns, ['id', 'created_at', 'updated_at']);
        echo 'Table columns: '.implode(', ', $tableColumns)."\n";

        // Determine the corresponding model file based on the table name
        preg_match('/Schema::create\(\'(.*?)\',/', file_get_contents($migrationFile), $matches);
        $tableName = $matches[1] ?? null;
        $modelName = Str::studly(Str::singular($tableName));
        $modelFile = __DIR__.sprintf('/app/Models/%s.php', $modelName);

        if (!file_exists($modelFile)) {
            echo "Model file for {$modelName} not found.\n";

            continue;
        }

        echo 'Comparing with model file: '.basename($modelFile)."\n";
        $modelAttributes = getModelAttributes($modelFile);
        echo 'Model attributes: '.implode(', ', $modelAttributes)."\n";

        $missingAttributes = array_diff($tableColumns, $modelAttributes);

        if ($missingAttributes !== []) {
            echo 'Model '.basename($modelFile).' is missing attributes: '.implode(', ', $missingAttributes)."\n";
        } else {
            echo 'Model '.basename($modelFile)." has all attributes.\n";
        }

        echo "\n";
    }
}

// Initialize Laravel application and execute the comparison
initializeLaravelApp();
compareMigrationsWithModels();
