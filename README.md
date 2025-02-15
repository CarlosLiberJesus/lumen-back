# https://api.bewhy.org

This will be the backend "controller".
Since is an Laravel Native App, we will keep the web routes for documentation, and the api/ to our main action with front-end.

The inner folder, might seem redundant, but can be use as dev-ops safe-guards and reduce the hidden files in project folder.

## Requirements

- composer v2.8.4
- PHP v8.4.1
- Composer v2.8.4
- Laravel framework ^11
- node: v18.20.5
- npm: 10.8.2
- python 3.12

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
   - Note: You'll need your on artisan file @ ./lumen-back/backend/
2. Navigate to the dev-only project directory:
   ```sh
   cd lumen-back
   ```
3. Install dependencies:
   ```sh
   npm i
   npx husky start
   ```
4. Navigate to the project directory and install precedencies:
   ```sh
   cd backend
   composer install
   ```
5. Finishing to validade env & remember the artisan file:
   ```sh
   cp .env.example .env
   ```
6. link ./resources/css/style.css to /public
   ```sh
   ln -s ./resources/css ./backend/public/css
   ```
7. Dont forget to run migrations:
   ```sh
   php artisan migrate
   ...
   ```

## Python Scripts

Some scripts iniside python

```sh
cd python
python3 -m venv venv
source venv/bin/activate

pip install PyMuPDF
python extract_text.py   # Edit the paths to file first
```

## Log History

- Dec 15, 2024 - First phpinfo();
- Dec 23, 2024 - Laravel v11.36.1 (PHP v8.4.1) Native
- Jan 04, 2025 - Newsletter Test Page
- Fev 10, 2025 - Including Python
