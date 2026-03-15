# Результаты Этап 5: ML-сервис

## Скриншоты

1. [`ml-service-swagger.png`](./ml-service-swagger.png) - Swagger UI (`http://localhost:8888/docs`)
2. [`ml-service-request.png`](./ml-service-request.png) - Пример запроса через Swagger или Postman
3. [`ml-service-logs.png`](./ml-service-logs.png) - Скриншот JSON-логов через API

## Логи

4. [`ml-service-startup.log`](./ml-service-startup.log) - Логи запуска и работы сервиса
5. [`ml-service-logs.json`](./ml-service-logs.json) - JSON-логи запросов из БД через API
6. [`ml-service-test-api.log`](./ml-service-test-api.log) - Лог автотестов API (`test_api.py`)

## Дополнительно

7. [`ml-service-db-logs.png`](./ml-service-db-logs.png) - Скриншот данных из таблицы `prediction_logs`
8. [`root-response.json`](./root-response.json) - Ответ корневого endpoint
9. [`health-response.json`](./health-response.json) - Ответ health-check endpoint
10. [`predict-response.json`](./predict-response.json) - Ответ endpoint предсказания

## Как получить

### Скриншоты
1. Запустите `make up-ml-service`
2. Откройте http://localhost:8888/docs
3. Выполните запрос через "Try it out" и откройте `http://localhost:8888/api/v1/logs?limit=10`
4. Сделайте скриншоты.

### Логи
```bash
# Логи запуска и работы сервиса
docker compose --profile ml-service logs --no-color ml-service > ml-service/results/ml-service-startup.log

# Выполните запрос предсказания:
curl -X POST "http://localhost:8888/api/v1/predict" \
     -H "Content-Type: application/json" \
     -d '{"features": [1.5, 2.3, 3.7]}'

# Получите JSON-логи из БД через API:
curl http://localhost:8888/api/v1/logs?limit=10 > ml-service/results/ml-service-logs.json

# Запустите автотест API и сохраните лог:
py -3 ml-service/test_api.py > ml-service/results/ml-service-test-api.log 2>&1
```

### База данных 
```bash
# Получить логи из БД через API
curl http://localhost:8888/api/v1/logs?limit=10
```

