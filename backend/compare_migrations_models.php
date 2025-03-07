<?php

declare(strict_types=1);

require __DIR__.'/vendor/autoload.php';

use Illuminate\Database\Eloquent\Model;
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

function getTableColumnsFromMigration($migrationFile): array
{
    $content = file_get_contents($migrationFile);
    preg_match('/Schema::create\(\'(.*?)\',/', $content, $matches);
    $tableName = $matches[1] ?? null;

    if ($tableName !== null && $tableName !== '' && $tableName !== '0') {
        preg_match_all('/\$table->(?!foreign)(.*?)\(\'(.*?)\'/', $content, $matches);

        return $matches[2] ?? [];
    }

    return [];
}

function getModelAttributes($modelFile)
{
    require_once $modelFile;
    $className = 'App\\Models\\'.basename((string) $modelFile, '.php');
    $model = new $className;

    return $model->getFillable();
}

function compareMigrationsWithModels(): void
{
    $migrationFiles = getMigrationFiles(__DIR__.'/database/migrations');
    getModelFiles(__DIR__.'/app/Models');

    foreach ($migrationFiles as $migrationFile) {
        $tableColumns = getTableColumnsFromMigration($migrationFile);

        if ($tableColumns === []) {
            continue;
        }

        // Ignore common columns
        $tableColumns = array_diff($tableColumns, ['id', 'created_at', 'updated_at']);

        // Determine the corresponding model file based on the table name
        preg_match('/Schema::create\(\'(.*?)\',/', file_get_contents($migrationFile), $matches);
        $tableName = $matches[1] ?? null;
        $modelName = Str::studly(Str::singular($tableName));
        $modelFile = __DIR__.sprintf('/app/Models/%s.php', $modelName);

        if (! file_exists($modelFile)) {
            continue;
        }

        $modelAttributes = getModelAttributes($modelFile);

        // Check if model is missing attributes from the table
        $missingAttributes = array_diff($tableColumns, $modelAttributes);
        if ($missingAttributes !== []) {
            echo 'Model '.basename($modelFile).' is missing attributes: '.implode(', ', $missingAttributes)."\n";
        } else {
            echo 'Model '.basename($modelFile)." has all attributes.\n";
        }

        // Check if table is missing attributes from the model
        $extraAttributes = array_diff($modelAttributes, $tableColumns);
        if ($extraAttributes !== []) {
            echo 'Table '.basename((string) $migrationFile).' is missing columns: '.implode(', ', $extraAttributes)."\n";
        } else {
            echo 'Table '.basename((string) $migrationFile)." has all columns.\n";
        }
    }
}

// Initialize Laravel application and execute the comparison
initializeLaravelApp();
compareMigrationsWithModels();
