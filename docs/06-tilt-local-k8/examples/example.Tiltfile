# Приклад Tiltfile для проекту з API та автотестами
# Запуск: tilt up
# Веб-інтерфейс: http://localhost:10350

# 1. Збираємо Docker-образ API-сервера з live update для швидкої розробки
docker_build(
    'api-server',
    './api',
    live_update=[
        sync('./api', '/app'),
    ],
)

# 2. Підключаємо docker-compose (якщо є окремі сервіси: БД, черги тощо)
# docker_compose('docker-compose.yml')

# 3. Локальний ресурс: автоматичний запуск тестів при зміні файлів у tests/
local_resource(
    'api-tests',
    cmd='npm run test',
    deps=['./tests', './api'],
    resource_deps=['api-server'],  # запускати тести після готовності api-server
)

# resource_deps гарантує, що тести не стартують до підняття API.
# trigger_mode=TRIGGER_MODE_MANUAL — якщо потрібен лише ручний запуск тестів.
