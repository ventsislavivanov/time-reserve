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

EXPOSE 8081

CMD ["sh", "-c", "if [ ! -f vendor/autoload.php ]; then composer install; fi && php artisan serve --host=0.0.0.0 --port=8081"]

# -------- Stage 2: Production --------
FROM php:8.2-fpm-alpine AS production

RUN apk add --no-cache bash curl libpng-dev libjpeg-turbo-dev freetype-dev oniguruma-dev libxml2-dev zip unzip postgresql-dev libpq
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY . /var/www

RUN rm -rf bootstrap/cache/*.php
RUN composer install --no-dev --optimize-autoloader --no-interaction --ignore-platform-reqs --no-plugins
RUN php artisan package:discover --ansi

RUN mkdir -p /var/www/storage/database && chown -R www-data:www-data /var/www

EXPOSE 9000

CMD ["php-fpm"]

