#!/usr/bin/env bash
# Запуск Playwright-тестів у Docker-контейнері
# Виконувати з кореня проекту, де є тести (наприклад, папка e2e або tests)
# Передумова: у поточній директорії є package.json з Playwright та тести

set -e

# Шлях до тестів відносно поточної директорії (можна змінити)
TEST_DIR="${TEST_DIR:-.}"

echo "Запуск тестів у Docker (Playwright образ) з директорії: $TEST_DIR"

docker run --rm -it --ipc=host \
  -v "$(pwd)/$TEST_DIR:/e2e" \
  -w /e2e \
  mcr.microsoft.com/playwright:v1.40.0-jammy \
  npx playwright test

# --rm       — видалити контейнер після завершення
# -it        — інтерактивний режим (бачити вивід)
# --ipc=host — рекомендується для стабільності Chrome у контейнері
# -v         — монтування папки з тестами в /e2e
# -w /e2e    — робоча директорія в контейнері
