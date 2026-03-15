# Этап 1: MLflow

## Описание

MLflow Tracking Server для отслеживания экспериментов и хранения артефактов ML-моделей.

## Компоненты

- **MLflow Server**: веб-интерфейс и API для логирования экспериментов
- **PostgreSQL**: хранение метаданных экспериментов
- **Volume**: локальное хранилище артефактов

## Запуск

```bash
# Запуск MLflow и PostgreSQL
make up-mlflow

# Просмотр логов
make logs-mlflow

# Остановка
make down-mlflow
```

## Доступ

- **MLflow UI**: http://localhost:5000
- **База данных**: PostgreSQL на порту 5432 (внутри контейнера)

## Настройка

Переменные окружения в `.env`:
- `MLFLOW_POSTGRES_USER` - пользователь PostgreSQL (по умолчанию: mlflow)
- `MLFLOW_POSTGRES_PASSWORD` - пароль PostgreSQL (по умолчанию: mlflow123)
- `MLFLOW_POSTGRES_DB` - имя базы данных (по умолчанию: mlflow)

## Проверка работы

1. Откройте http://localhost:5000
2. Создайте новый эксперимент через UI или API
3. Залогируйте метрики и параметры

## Результаты

Скриншоты и логи развертывания:

- [Скриншот веб-интерфейса MLflow](results/mlflow-ui.png) - главная страница с экспериментами
- [Скриншот созданного эксперимента](results/mlflow-experiment.png) - пример созданного эксперимента
- [Логи миграции базы данных](results/mlflow-migrations.log) - успешная инициализация БД
- [Логи запуска сервера](results/mlflow-server.log) - запуск MLflow server

## Пример использования

Базовый пример:

```python
import mlflow

# Подключение к tracking server
mlflow.set_tracking_uri("http://localhost:5000")

# Создание эксперимента
mlflow.create_experiment("test-experiment")

# Логирование параметров и метрик
with mlflow.start_run():
    mlflow.log_param("param1", 5)
    mlflow.log_metric("accuracy", 0.95)
    mlflow.log_artifact("model.pkl")
```

Расширенный пример см. в файле [example_experiment.py](example_experiment.py):

```bash
# Запустите после старта MLflow
python mlflow/example_experiment.py
```

Этот скрипт создаст эксперимент с двумя runs, продемонстрирует логирование параметров, метрик и артефактов.
