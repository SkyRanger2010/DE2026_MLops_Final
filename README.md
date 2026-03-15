# Итоговая работа по курсу MLops (DataOps)

Репозиторий содержит полный цикл развертывания ML-инфраструктуры: от MLflow и Airflow до развертывания ML-сервиса в Kubernetes с мониторингом.


## О проекте

Этот репозиторий содержит полную реализацию итоговой работы по курсу MLops:
- 9 этапов развертывания ML-инфраструктуры
- Единый docker-compose.yaml с профилями для каждого этапа
- Makefile для удобного управления сервисами
- Детальная документация в каждой папке этапа

## Структура проекта

```
DE2026_MLops_Final/
├── docker-compose.yaml     # Общий compose со всеми сервисами (profiles)
├── Makefile                # Команды для запуска этапов
├── .env.example            # Шаблон переменных окружения
├── README.md               # Этот файл
├── mlflow/                 # Этап 1: MLflow Tracking Server
├── airflow/                # Этап 2: Apache Airflow
├── lakefs/                 # Этап 3: LakeFS (версионирование данных)
├── jupyterhub/             # Этап 4: JupyterHub
├── ml-service/             # Этап 5: FastAPI ML-сервис
├── monitoring/             # Этап 6: Prometheus + Grafana
├── k8s/                    # Этап 7: Kubernetes манифесты
├── helm/                   # Этап 8: Helm chart
└── prompt-storage/         # Этап 9: Prompt Storage в MLflow
```

## Быстрый старт

### 1. Подготовка

```bash
# Скопируйте и настройте переменные окружения
cp .env.example .env

# Отредактируйте .env, установите пароли и секретные ключи
```

### 2. Запуск всех сервисов

```bash
# Запустить все этапы сразу
make up-all

# Или запускать по отдельности
make up-mlflow
make up-airflow
make up-lakefs
make up-jupyterhub
make up-ml-service
make up-monitoring
```

### 3. Проверка статуса

```bash
# Статус всех контейнеров
make status

# Логи конкретного этапа
make logs-mlflow
make logs-ml-service
```

## Makefile команды

### Управление всеми сервисами

- `make help` - показать справку
- `make up-all` - запустить все сервисы
- `make down` - остановить все сервисы
- `make status` - показать статус контейнеров
- `make logs` - показать логи всех контейнеров

### Управление по этапам

Каждый этап имеет команды: `up-*`, `down-*`, `logs-*`

- `make up-mlflow` / `make logs-mlflow` / `make down-mlflow`
- `make up-airflow` / `make logs-airflow` / `make down-airflow`
- `make up-lakefs` / `make logs-lakefs` / `make down-lakefs`
- `make up-jupyterhub` / `make logs-jupyterhub` / `make down-jupyterhub`
- `make up-ml-service` / `make logs-ml-service` / `make down-ml-service`
- `make up-monitoring` / `make logs-monitoring` / `make down-monitoring`
- `make up-prompt-storage` / `make logs-prompt-storage` / `make down-prompt-storage`

## Результаты по этапам

| Этап | Описание | Инструкции | Результаты |
|------|----------|------------|------------|
| 1 | MLflow Tracking Server | [mlflow/README.md](mlflow/README.md) | [mlflow/results/](mlflow/results/) |
| 2 | Apache Airflow | [airflow/README.md](airflow/README.md) | [airflow/results/](airflow/results/) |
| 3 | LakeFS | [lakefs/README.md](lakefs/README.md) | [lakefs/results/](lakefs/results/) |
| 4 | JupyterHub | [jupyterhub/README.md](jupyterhub/README.md) | [jupyterhub/results/](jupyterhub/results/) |
| 5 | ML-сервис (FastAPI) | [ml-service/README.md](ml-service/README.md) | [ml-service/results/](ml-service/results/) |
| 6 | Мониторинг (Prometheus/Grafana) | [monitoring/README.md](monitoring/README.md) | [monitoring/results/](monitoring/results/) |
| 7 | Kubernetes манифесты | [k8s/README.md](k8s/README.md) | [k8s/results/](k8s/results/) |
| 8 | Helm chart | [helm/README.md](helm/README.md) | [helm/results/](helm/results/) |
| 9 | Prompt Storage MLflow | [prompt-storage/README.md](prompt-storage/README.md) | [prompt-storage/results/](prompt-storage/results/) |


## Доступ к сервисам

После запуска сервисы доступны по следующим адресам:

- **MLflow**: http://localhost:5000
- **MLflow Prompt Storage (Этап 9)**: http://localhost:5001
- **Airflow**: http://localhost:8080 (admin/admin)
- **LakeFS**: http://localhost:8001
- **MinIO Console**: http://localhost:9001 (minioadmin/minioadmin123)
- **JupyterHub**: http://localhost:8000 (admin/password)
- **ML-сервис**: http://localhost:8888
  - API Docs: http://localhost:8888/docs
  - Metrics: http://localhost:8888/metrics
- **Prometheus**: http://localhost:9090
- **Grafana**: http://localhost:3000 (admin/admin)

## Описание этапов

### Этап 1: MLflow

Tracking server для логирования экспериментов и хранения артефактов моделей.

**Проверка:**
- Открыть http://localhost:5000
- Создать эксперимент
- Залогировать параметры и метрики

[Подробные инструкции →](mlflow/README.md)

### Этап 2: Airflow

Оркестрация ML-пайплайнов и автоматизация задач.

**Проверка:**
- Открыть http://localhost:8080
- Войти (admin/admin)
- Убедиться, что интерфейс загружается

[Подробные инструкции →](airflow/README.md)

### Этап 3: LakeFS

Версионирование данных с Git-подобным подходом (branches, commits, merges).

**Проверка:**
- Открыть http://localhost:8001
- Создать репозиторий
- Создать ветку, добавить файл, сделать commit

[Подробные инструкции →](lakefs/README.md)

### Этап 4: JupyterHub

Многопользовательская среда для работы с Jupyter notebooks.

**Проверка:**
- Открыть http://localhost:8000
- Войти (admin/password)
- Запустить JupyterLab

[Подробные инструкции →](jupyterhub/README.md)

### Этап 5: ML-сервис

FastAPI REST API с endpoint /api/v1/predict, логированием в JSON и БД.

**Проверка:**
```bash
curl -X POST "http://localhost:8888/api/v1/predict" \
     -H "Content-Type: application/json" \
     -d '{"features": [1.5, 2.3, 3.7]}'
```

[Подробные инструкции →](ml-service/README.md)

### Этап 6: Мониторинг

Prometheus для сбора метрик ML-сервиса и Grafana для визуализации.

**Проверка:**
- Открыть http://localhost:3000
- Добавить Prometheus Data Source
- Создать дашборд с метриками сервиса

[Подробные инструкции →](monitoring/README.md)

### Этап 7: Kubernetes манифесты

Deployment, Service, Ingress с настроенными startup/readiness/liveness проверками.

**Применение:**
```bash
kubectl apply -f k8s/
kubectl get pods
```

[Подробные инструкции →](k8s/README.md)

### Этап 8: Helm chart

Упаковка ML-сервиса в Helm с настраиваемыми параметрами (версия образа, ресурсы).

**Установка:**
```bash
helm install ml-service-release ./helm/ml-service
helm list
```

[Подробные инструкции →](helm/README.md)

### Этап 9: Prompt Storage

Создание версий промптов в отдельном MLflow для LLM-приложений.

**Проверка:**
- Запустить `make up-prompt-storage`
- Открыть http://localhost:5001 → Prompt Engineering
- Создать несколько версий промптов

[Подробные инструкции →](prompt-storage/README.md)

## Технологический стек

- **Docker & Docker Compose**: контейнеризация
- **Python 3.11-3.12**: основной язык
- **PostgreSQL**: хранение метаданных
- **MLflow**: tracking экспериментов
- **Apache Airflow**: оркестрация
- **LakeFS**: версионирование данных
- **MinIO**: S3-совместимое хранилище
- **JupyterHub**: среда разработки
- **FastAPI**: ML REST API
- **Prometheus & Grafana**: мониторинг
- **Kubernetes**: оркестрация контейнеров
- **Helm**: пакетный менеджер для K8s

## Требования

### Обязательно

- Docker Desktop или Docker Engine + Docker Compose
- Python 3.11+ (для запуска вспомогательных скриптов)
- 8+ GB RAM для запуска всех сервисов
- 20+ GB свободного места на диске

### Опционально

- Make (для Windows: можно установить через chocolatey или использовать WSL)
- Kubernetes кластер (для этапов 7-8): minikube, kind, Docker Desktop K8s
- Helm (для этапа 8)

### Python зависимости

```bash
pip install -e .
```

## Troubleshooting

### Порты заняты

Если порты 5000, 8080, 8001, 8888, 9090, 3000 заняты, измените их в `docker-compose.yaml`:

```yaml
ports:
  - "5001:5000"  # MLflow на другом порту
```

### Проблемы с PostgreSQL

```bash
# Проверка логов
make logs-mlflow  # или другой этап

# Пересоздание с чистыми данными
docker compose --profile mlflow down -v
make up-mlflow
```

### Проблемы с сетью

Убедитесь, что все сервисы в одной сети `mlops-network`:

```bash
docker network inspect de2026_mlops_final_mlops-network
```

### Контейнер не запускается

```bash
# Проверьте логи
make logs-<этап>

# Проверьте переменные окружения в .env
# Проверьте, что PostgreSQL успела запуститься (healthcheck)
```

## Лицензия

Apache License 2.0

## Автор

Сатанцев В.И. (Студент магистратуры "Инженерия данных" 2 курса гр. МИНДА241)
