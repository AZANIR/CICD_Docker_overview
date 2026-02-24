# Playwright + Docker — робочий приклад

Цей приклад показує, як запускати Playwright-тести **локально** та **в Docker-контейнері**. Використовується офіційний образ Playwright (MCR); тести йдуть проти публічної сторінки example.com, тому додатковий сервер не потрібен.

## Передумови

- **Локально:** Node.js 18+, npm. Після `npm install` виконайте `npx playwright install` (браузери).
- **Docker:** встановлений Docker Desktop або Docker Engine.

## Запуск локально

```bash
cd examples/test-frameworks/playwright-docker
npm install
npx playwright install
npm run test
```

## Запуск у Docker

### Варіант 1: збірка образу та запуск

```bash
cd examples/test-frameworks/playwright-docker
docker build -t playwright-docker-demo .
docker run --rm playwright-docker-demo
```

### Варіант 2: монтування коду (без перезбірки при зміні тестів)

```bash
docker run --rm -v "$(pwd):/e2e" -w /e2e --ipc=host \
  mcr.microsoft.com/playwright:v1.49.0-jammy \
  sh -c "npm ci && npx playwright test"
```

Для Chrome у контейнері рекомендується `--ipc=host`.

## Структура

- `playwright.config.ts` — конфігурація (baseURL example.com, reporter).
- `tests/example.spec.ts` — два простих e2e-тести.
- `Dockerfile` — образ на базі офіційного Playwright для запуску тестів.

## Скрипти

- `npm run test` — запуск тестів (headless).
- `npm run test:ui` — інтерактивний UI mode (локально).
- `npm run report` — відкрити HTML-звіт після прогону.
