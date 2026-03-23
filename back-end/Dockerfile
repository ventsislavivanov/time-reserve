# -------- Stage 1: Build dependencies --------
FROM composer:2 AS vendor

WORKDIR /app

COPY . .

RUN composer install \
    --no-dev \
    --no-interaction \
    --prefer-dist \
    --optimize-autoloader

# -------- Stage 2: App --------
FROM php:8.2-fpm-alpine

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

RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

WORKDIR /var/www

COPY --from=vendor /app /var/www

RUN mkdir -p /var/www/storage/database \
    && chown -R www-data:www-data /var/www

EXPOSE 8080

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
