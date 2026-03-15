# Результаты Этап 2: Airflow

## Скриншоты

1. [`airflow-ui.png`](./airflow-ui.png) - Страница Airflow UI "Cluster Activity" (http://localhost:8080)
2. [`airflow-dags.png`](./airflow-dags.png) - Граф задач внутри example DAG

## Логи

3. [`airflow-init.log`](./airflow-init.log) - Логи инициализации БД
4. [`airflow-webserver.log`](./airflow-webserver.log) - Логи запуска webserver
5. [`airflow-scheduler.log`](./airflow-scheduler.log) - Логи запуска scheduler
6. [`airflow-triggerer.log`](./airflow-triggerer.log) - Логи запуска triggerer

## Как получить

### Скриншоты
1. Запустите `make up-airflow`
2. Дождитесь инициализации (60-90 секунд)
3. Откройте http://localhost:8080
4. Войдите (admin/admin)
5. Сделайте скриншоты

### Логи
```bash
docker compose --profile airflow logs airflow-init > airflow/results/airflow-init.log
docker compose --profile airflow logs airflow-webserver > airflow/results/airflow-webserver.log
docker compose --profile airflow logs airflow-scheduler > airflow/results/airflow-scheduler.log
docker compose --profile airflow logs airflow-triggerer > airflow/results/airflow-triggerer.log
```

