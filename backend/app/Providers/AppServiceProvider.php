<?php

declare(strict_types=1);

namespace App\Providers;

use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

final class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void {}

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $this->configureModels();
        $this->configureCommands();
        $this->configureDate();
    }

    /**
     * Configure the models.
     */
    private function configureModels(): void
    {
        Model::shouldBeStrict(! $this->app->environment('production'));

        Model::unguard();
    }

    private function configureCommands(): void
    {
        if ($this->app->environment('production')) {
            DB::prohibitDestructiveCommands(
                true
            );
            URL::forceScheme('https');
        }
    }

    /**
     * Configure the application date.
     */
    private function configureDate(): void
    {
        Date::use(CarbonImmutable::class);
    }
}
