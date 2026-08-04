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

# 1. Копираме първо само composer файловете за оптимално кеширане
COPY composer.json composer.lock ./

# 2. Инсталираме всички dev зависимости ОЩЕ ПРИ BUILD
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --prefer-dist --no-interaction --no-scripts

# 3. Копираме останалата част от кода
COPY . /var/www

# 4. Генерираме ауторайтъра на composer
RUN composer dump-autoload

RUN mkdir -p /var/www/storage/database && chown -R www-data:www-data /var/www

EXPOSE 8081

# CMD вече само стартира сървъра, без да се опитва да инсталира нищо в движение
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8081"]

# -------- Stage 2: Production --------
FROM php:8.2-fpm-alpine AS production

RUN apk add --no-cache bash curl libpng-dev libjpeg-turbo-dev freetype-dev oniguruma-dev libxml2-dev zip unzip postgresql-dev libpq
RUN docker-php-ext-install pdo pdo_pgsql mbstring exif pcntl bcmath gd

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Копираме целия проект в контейнера
COPY . /var/www

# Принудително инсталираме зависимостите ВЪТРЕ в контейнера
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install --no-dev --optimize-autoloader --no-interaction --ignore-platform-reqs

RUN rm -rf bootstrap/cache/*.php
RUN php artisan package:discover --ansi

RUN mkdir -p /var/www/storage/database && chown -R www-data:www-data /var/www

EXPOSE 9000

CMD ["php-fpm"]
