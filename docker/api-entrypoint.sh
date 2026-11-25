#!/bin/sh
# Prepares and starts the Laravel API for local development.
set -e
cd /var/www

[ -f .env ] || cp .env.example .env

if [ ! -f vendor/autoload.php ]; then
    composer install --no-interaction --prefer-dist
fi

if ! grep -q '^APP_KEY=.\+' .env; then
    php artisan key:generate --force
fi

php artisan migrate --force

# Seed the demo data only into an empty database.
if [ "$(php artisan tinker --execute='echo App\Models\User::count();' | tail -n 1)" = "0" ]; then
    php artisan db:seed --force
fi

exec php artisan serve --host=0.0.0.0 --port=8989
