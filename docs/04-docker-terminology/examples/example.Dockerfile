# Приклад Dockerfile для Node.js-додатку (навчальний)
# Збірка: docker build -t my-app:latest .
# Запуск: docker run -p 3000:3000 my-app:latest

# Базовий образ — офіційний Node.js 20 LTS
FROM node:20-alpine

# Робоча директорія всередині контейнера
WORKDIR /app

# Копіюємо файли залежностей спочатку (краще кешування шарів)
COPY package.json package-lock.json* ./

# Встановлюємо залежності (тільки production для меншого образу)
RUN npm ci --omit=dev

# Копіюємо вихідний код
COPY . .

# Документуємо порт (реально відкривається через docker run -p)
EXPOSE 3000

# Команда запуску при старті контейнера
CMD ["node", "index.js"]
