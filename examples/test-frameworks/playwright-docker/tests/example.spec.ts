// Робочий приклад e2e-тесту для курсу CI/CD та Docker
// Тест перевіряє публічну сторінку example.com — не потрібен власний сервер
// Запуск: npm run test (локально) або в Docker (див. README та Dockerfile)

import { test, expect } from '@playwright/test';

test.describe('Приклад e2e для Docker/CI', () => {
  // Простий тест: сторінка завантажується і містить очікуваний текст
  test('головна сторінка example.com відповідає і містить заголовок', async ({ page }) => {
    await page.goto('/');

    // Перевірка, що сторінка завантажилась (статус 200 і тіло є)
    await expect(page).toHaveTitle(/Example Domain/);

    // Перевірка наявності тексту на сторінці
    await expect(page.getByRole('heading', { name: 'Example Domain' })).toBeVisible();
  });

  // Додатковий тест: перевірка посилання в контенті (example.com містить посилання на iana.org)
  test('на сторінці є посилання на iana.org', async ({ page }) => {
    await page.goto('/');

    const link = page.locator('a[href*="iana.org"]').first();
    await expect(link).toBeVisible();
    await expect(link).toHaveAttribute('href', /iana\.org/);
  });
});
