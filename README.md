# https://api.bewhy.org

This will be the backend "controller".
Since is an Laravel Native App, we will keep the web routes for documentation, and the api/ to our main action with front-end.

The inner folder, might seem redundant, but can be use as dev-ops safe-guards and reduce the hidden files in project folder.

## Requirements

- PHP v8.4.1
- Composer v2.8.4
- Laravel framework ^11

## Possible upgrades for blade:

- laravel/telescope
- arcanedev/log-viewer
- spatie/laravel-schedule-monitor

#### Probably will need

- laravel/passport | laravel/socialite to protect pages
- spatie/laravel-error-solutions for blade errors

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/CarlosLiberJesus/lumen-back.git
   ```
   - Note: You'll need your on artisan file
2. Navigate to the project directory:
   ```sh
   cd lumen-back
   ```
3. Install dependencies:
   ```sh
   composer install
   ```
4. Copy the example environment file and modify it according to your environment:
   ```sh
   cp .env.example .env
   ```
5. Generate an application key:
   ```sh
   php artisan key:generate
   ```

## Server Start

- Dec 15, 2024 - First phpinfo();
- Dec 23, 2024 - Laravel v11.36.1 (PHP v8.4.1) Native

## Switch Dev

- Dec 23, 2024 - Already cache config issues

## Cheat Codes

- Start the server:
  ```sh
  php -S localhost:5100 -t public/
  ```

## Running Tests

To run tests, use the following command:

```sh
    php artisan test
```
