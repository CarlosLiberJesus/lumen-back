<?php

declare(strict_types=1);

namespace App\Providers;

use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use Laravel\Sanctum\PersonalAccessToken;
use Laravel\Sanctum\Sanctum;

final class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Sanctum::usePersonalAccessTokenModel(PersonalAccessToken::class);
        $this->configureModels();
        $this->configureCommands();
        $this->configureDate();
    }

    /**
     * Configure the models.
     */
    private function configureModels(): void
    {
        Model::shouldBeStrict(!$this->app->isProduction());

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
