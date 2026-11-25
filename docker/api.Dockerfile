# Local development image for the Laravel API (not used in production, see back-end/Dockerfile).
FROM php:8.3-cli-alpine

RUN apk add --no-cache \
        bash git unzip curl \
        libpng-dev libjpeg-turbo-dev freetype-dev \
        oniguruma-dev libxml2-dev libzip-dev \
        postgresql-dev libpq \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
