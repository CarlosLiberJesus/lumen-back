<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Laravel\Sanctum\PersonalAccessToken;
use Laravel\Sanctum\Sanctum;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Sanctum::usePersonalAccessTokenModel(PersonalAccessToken::class);
        //$this->configureModels();
    }

    /**
     * Configure the models.
     *
     * @todo perceber porque dá erro
     */
    // private function configureModels(): void
    // {
    //     Model::shouldBeStrict(!$this->app->isProduction());
    // }

}
