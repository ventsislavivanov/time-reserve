#!/bin/bash

# Спиране при първата възникнала грешка
set -e

echo "🚀 Стартиране на първоначална настройка за Time Reserve..."

# 1. Проверка за .env файлове
if [ ! -f .env ]; then
    echo "📄 Създаване на главен .env..."
    cp .env.example .env 2>/dev/null || echo "⚠️  Липсва главен .env.example! Създай .env ръчно."
fi

if [ ! -f back-end/.env ]; then
    echo "📄 Създаване на .env за Laravel..."
    cp back-end/.env.example back-end/.env 2>/dev/null || echo "⚠️  Липсва back-end/.env.example!"
fi

if [ ! -f front-end-react/.env ]; then
    echo "📄 Създаване на .env за React..."
    cp front-end-react/.env.example front-end-react/.env 2>/dev/null || echo "⚠️  Липсва front-end-react/.env.example!"
fi

# Двойна проверка дали главният .env вече съществува
if [ ! -f .env ]; then
    echo "❌ Грешка: Главният .env файл липсва и не може да бъде генериран. Скриптът спира."
    exit 1
fi

# 2. Рестартиране на Docker средата
echo "🔄 Изчистване на стари контейнери и данни..."
docker compose down

if [ -d "./appdata/postgres" ]; then
    echo "🗑️  Изтриване на старата локална база данни..."
    sudo rm -rf ./appdata/postgres
fi

# 3. Вдигане на базата данни на чисто
echo "🐘 Стартиране на PostgreSQL..."
docker compose up -d database

echo "⏳ Изчакване 5 секунди за инициализация на Postgres..."
sleep 5

# 4. Наливане на дъмпа в локалната база
echo "💾 Наливане на дъмпа в 'time_reserve_local'..."
docker exec -i time-reserve-db psql -U postgres -d time_reserve_local < ./init_project_db.sql

# 5. Вдигане на останалите контейнери за Разработка (DEV)
echo "🐳 Стартиране на всички приложения за Разработка..."
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build

# 5.1. Инсталиране на dependencies и генериране на ключ в Laravel контейнера
echo "🔑 Генериране на APP_KEY за Laravel..."
docker exec -i time-reserve-backend php artisan key:generate

# 6. Финални настройки в Laravel
echo "🧹 Изчистване на кеша на Laravel..."
docker exec -i time-reserve-backend php artisan config:clear
docker exec -i time-reserve-backend php artisan cache:clear

echo "✅ Проектът е успешно пуснат!"
echo "📍 Laravel: http://localhost:8081"
echo "📍 React:   http://localhost:5173"
echo "📍 Angular: http://localhost:4200"
