# Этап 5: ML-сервис

## Описание

FastAPI-сервис для ML-предсказаний с логированием запросов в JSON и сохранением истории в PostgreSQL.

## Компоненты

- **FastAPI приложение**: REST API с endpoint /api/v1/predict
- **PostgreSQL**: хранение логов предсказаний (вход, выход, время, версия модели)
- **Структурированное логирование**: все запросы логируются в JSON-формате

## Запуск

```bash
# Запуск ML-сервиса и PostgreSQL
make up-ml-service

# Просмотр логов
make logs-ml-service

# Остановка
make down-ml-service
```

## Доступ

- **API**: http://localhost:8888
- **Документация (Swagger)**: http://localhost:8888/docs

## API Endpoints

### POST /api/v1/predict

Выполнение предсказания модели.

**Запрос:**
```json
{
  "features": [1.5, 2.3, 3.7]
}
```

**Ответ:**
```json
{
  "prediction": 2.24,
  "model_version": "1.0.0",
  "timestamp": "2026-03-15T12:34:56.789"
}
```

### GET /health

Health check для Kubernetes probes.

### GET /api/v1/logs

Получение последних логов предсказаний из БД (параметр `limit`, по умолчанию 10).

## Модель

Текущая реализация использует простую модель-заглушку (взвешенное среднее входных признаков). В продакшене можно заменить на:
- Загрузку модели из MLflow
- Предобученную sklearn/pytorch/tensorflow модель
- Внешний API предсказаний

## Логирование

### JSON-логи

Все запросы логируются в структурированном JSON-формате:

```json
{
  "timestamp": "2026-03-15T12:34:56.789",
  "level": "INFO",
  "event": "prediction_made",
  "input_features": [1.5, 2.3, 3.7],
  "output_prediction": 2.24,
  "model_version": "1.0.0",
  "inference_time_ms": 12.34
}
```

### База данных

Таблица `prediction_logs` хранит:
- `id` - уникальный идентификатор
- `timestamp` - время предсказания
- `input_features` - входные признаки (JSON)
- `output_prediction` - результат предсказания
- `model_version` - версия модели
- `inference_time_ms` - время выполнения в миллисекундах

## Настройка

Переменные окружения в `.env`:
- `MLSERVICE_POSTGRES_USER` - пользователь PostgreSQL (по умолчанию: mlservice)
- `MLSERVICE_POSTGRES_PASSWORD` - пароль PostgreSQL
- `MLSERVICE_POSTGRES_DB` - имя базы данных
- `MODEL_VERSION` - версия модели (по умолчанию: 1.0.0)

## Пример запроса

```bash
# Через curl
curl -X POST "http://localhost:8888/api/v1/predict" \
     -H "Content-Type: application/json" \
     -d '{"features": [1.5, 2.3, 3.7]}'

# Через Python
import requests

response = requests.post(
    "http://localhost:8888/api/v1/predict",
    json={"features": [1.5, 2.3, 3.7]}
)
print(response.json())
```

## Результаты

Скриншоты и логи развертывания:

- [Скриншот Swagger UI](results/ml-service-swagger.png) - документация API
- [Пример запроса и ответа](results/ml-service-request.png) - тестовый запрос
- [Скриншот JSON-логов API](results/ml-service-logs.png) - ответ endpoint `/api/v1/logs`
- [Пример JSON-логов](results/ml-service-logs.json) - структурированное логирование
- [Лог автотестов API](results/ml-service-test-api.log) - результат запуска `test_api.py`
- [Скриншот БД с логами](results/ml-service-db-logs.png) - таблица prediction_logs
- [Логи запуска сервиса](results/ml-service-startup.log) - успешный запуск
- [Ответ корневого endpoint](results/root-response.json) - проверка `/`
- [Ответ health-check endpoint](results/health-response.json) - проверка `/health`
- [Ответ endpoint предсказания](results/predict-response.json) - проверка `POST /api/v1/predict`
