# Результаты Этап 1: MLflow

## Скриншоты 

1. [`mlflow-ui..png`](./mlflow-ui..png) - Главная страница MLflow UI (http://localhost:5000)
2. [`mlflow-experiment.png`](./mlflow-experiment.png) - Созданный эксперимент с параметрами и метриками

## Логи 

3. [`mlflow-migrations.log`](./mlflow-migrations.log) - Логи успешной миграции БД
4. [`mlflow-server.log`](./mlflow-server.log) - Логи запуска MLflow server

## Как получить

### Скриншоты
1. Запустите `make up-mlflow`
2. Откройте http://localhost:5000
3. Создайте эксперимент (см. TESTING.md)
4. Сделайте скриншоты

### Логи
```bash
# Получить логи
docker compose --profile mlflow logs mlflow > mlflow/results/mlflow-server.log
docker compose --profile mlflow logs postgres-mlflow > mlflow/results/mlflow-migrations.log
```
