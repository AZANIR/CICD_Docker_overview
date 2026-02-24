# Dockerfile для запуску Playwright-тестів у контейнері
# Збірка: docker build -t playwright-docker-demo .
# Запуск: docker run --rm playwright-docker-demo
# Для інтерактивного режиму: docker run -it --rm playwright-docker-demo

# Офіційний образ Playwright (Ubuntu 22.04, з браузерами)
# Тег образу: версія Playwright + ОС (jammy = Ubuntu 22.04)
FROM mcr.microsoft.com/playwright:v1.40.0-jammy

# Робоча директорія в контейнері
WORKDIR /e2e

# Копіюємо залежності проекту
COPY package.json package-lock.json* ./

# Встановлюємо залежності (тільки production не потрібно — потрібні devDependencies для тестів)
RUN npm ci

# Копіюємо конфіг та тести
COPY playwright.config.ts ./
COPY tests/ ./tests/

# За замовчуванням запускаємо тести (headless)
CMD ["npx", "playwright", "test"]
