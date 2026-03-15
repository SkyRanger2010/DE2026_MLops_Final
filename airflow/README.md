# Этап 2: Airflow

## Описание

Apache Airflow для оркестрации ML-пайплайнов и автоматизации задач.

## Компоненты

- **Airflow Webserver**: веб-интерфейс для управления DAG'ами
- **Airflow Scheduler**: планировщик задач
- **Airflow Triggerer**: выполнение deferred/sensor-задач
- **Airflow Init**: инициализация базы данных и создание admin-пользователя
- **PostgreSQL**: хранение метаданных Airflow

## Запуск

```bash
# Запуск Airflow (webserver, scheduler, triggerer, init)
make up-airflow

# Просмотр логов
make logs-airflow

# Остановка
make down-airflow
```

## Доступ

- **Airflow UI**: http://localhost:8080
- **Логин**: admin (по умолчанию)
- **Пароль**: admin (по умолчанию, см. .env)

## Настройка

Переменные окружения в `.env`:
- `AIRFLOW_POSTGRES_USER` - пользователь PostgreSQL (по умолчанию: airflow)
- `AIRFLOW_POSTGRES_PASSWORD` - пароль PostgreSQL (по умолчанию: airflow123)
- `AIRFLOW_POSTGRES_DB` - имя базы данных (по умолчанию: airflow)
- `AIRFLOW_ADMIN_USER` - логин администратора (по умолчанию: admin)
- `AIRFLOW_ADMIN_PASSWORD` - пароль администратора (по умолчанию: admin)

## Проверка работы

1. Откройте http://localhost:8080
2. Войдите с учетными данными admin/admin
3. Убедитесь, что интерфейс загружается корректно

## DAG'и

В проекте уже создана папка `dags/` с примером DAG:
- [example_ml_pipeline.py](dags/example_ml_pipeline.py) - пример ML pipeline

Папка `dags/` автоматически монтируется в контейнеры Airflow. Любые новые DAG'и, добавленные в эту папку, будут автоматически подхвачены scheduler'ом.

### Создание своего DAG

1. Создайте Python-файл в `airflow/dags/`
2. Определите DAG и задачи
3. Airflow автоматически обнаружит новый DAG (через 30-60 секунд)
4. Проверьте в UI: http://localhost:8080

## Результаты

Скриншоты и логи развертывания:

- [Скриншот веб-интерфейса Airflow](results/airflow-ui.png) - страница "Cluster Activity"
- [Скриншот графа задач DAG](results/airflow-dags.png) - граф задач внутри example DAG
- [Логи инициализации БД](results/airflow-init.log) - успешная миграция
- [Логи запуска webserver](results/airflow-webserver.log) - запуск веб-сервера
- [Логи запуска scheduler](results/airflow-scheduler.log) - запуск планировщика
- [Логи запуска triggerer](results/airflow-triggerer.log) - запуск triggerer
