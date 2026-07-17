# -------- Stage 1: Development --------
FROM php:8.2-fpm-alpine AS development

RUN apk add --no-cache \
    bash \
    curl \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    libxml2-dev \
    zip \
    unzip \
    postgresql-dev \
    libpq

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

WORKDIR /var/www
COPY . /var/www
RUN mkdir -p /var/www/storage/database && chown -R www-data:www-data /var/www

EXPOSE 8080

CMD ["sh", "-c", "until [ -f vendor/autoload.php ]; do echo 'Waiting for vendor...'; sleep 3; done && php artisan serve --host=0.0.0.0 --port=8080"]

# -------- Stage 2: Production --------
FROM php:8.2-fpm-alpine AS production

RUN apk add --no-cache bash curl libpng-dev libjpeg-turbo-dev freetype-dev oniguruma-dev libxml2-dev zip unzip postgresql-dev libpq
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . /var/www

RUN composer install --no-dev --optimize-autoloader --no-interaction --no-plugins

RUN mkdir -p /var/www/storage/database && chown -R www-data:www-data /var/www

EXPOSE 9000

CMD ["php-fpm"]

