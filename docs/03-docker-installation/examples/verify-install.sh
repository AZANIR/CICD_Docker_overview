#!/usr/bin/env bash
# Скрипт перевірки встановлення Docker
# Запуск: bash verify-install.sh (або chmod +x verify-install.sh && ./verify-install.sh)

set -e

echo "=== Перевірка Docker ==="

if ! command -v docker &> /dev/null; then
  echo "Помилка: команда 'docker' не знайдена. Встановіть Docker Desktop з https://docker.com"
  exit 1
fi

echo "Docker знайдено: $(docker --version)"

echo ""
echo "Запуск тестового контейнера hello-world..."
docker run --rm hello-world

echo ""
echo "Встановлення перевірено успішно."
