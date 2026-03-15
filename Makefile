.PHONY: help up-all down status logs
.PHONY: up-mlflow down-mlflow logs-mlflow
.PHONY: up-airflow down-airflow logs-airflow
.PHONY: up-lakefs down-lakefs logs-lakefs
.PHONY: up-jupyterhub down-jupyterhub logs-jupyterhub
.PHONY: up-ml-service down-ml-service logs-ml-service
.PHONY: up-monitoring down-monitoring logs-monitoring
.PHONY: up-prompt-storage down-prompt-storage logs-prompt-storage

help:
	@echo "=== MLops Final Project - Makefile ==="
	@echo ""
	@echo "Запуск всех сервисов:"
	@echo "  make up-all          - Поднять все профили"
	@echo "  make down            - Остановить все сервисы"
	@echo "  make status          - Показать статус контейнеров"
	@echo "  make logs            - Показать логи всех контейнеров"
	@echo ""
	@echo "Этап 1: MLflow"
	@echo "  make up-mlflow       - Запустить MLflow + PostgreSQL"
	@echo "  make down-mlflow     - Остановить MLflow"
	@echo "  make logs-mlflow     - Логи MLflow"
	@echo ""
	@echo "Этап 2: Airflow"
	@echo "  make up-airflow      - Запустить Airflow + PostgreSQL"
	@echo "  make down-airflow    - Остановить Airflow"
	@echo "  make logs-airflow    - Логи Airflow"
	@echo ""
	@echo "Этап 3: LakeFS"
	@echo "  make up-lakefs       - Запустить LakeFS + PostgreSQL + MinIO"
	@echo "  make down-lakefs     - Остановить LakeFS"
	@echo "  make logs-lakefs     - Логи LakeFS"
	@echo ""
	@echo "Этап 4: JupyterHub"
	@echo "  make up-jupyterhub   - Запустить JupyterHub"
	@echo "  make down-jupyterhub - Остановить JupyterHub"
	@echo "  make logs-jupyterhub - Логи JupyterHub"
	@echo ""
	@echo "Этап 5: ML-сервис"
	@echo "  make up-ml-service   - Запустить ML-сервис + PostgreSQL"
	@echo "  make down-ml-service - Остановить ML-сервис"
	@echo "  make logs-ml-service - Логи ML-сервиса"
	@echo ""
	@echo "Этап 6: Мониторинг"
	@echo "  make up-monitoring   - Запустить Prometheus + Grafana"
	@echo "  make down-monitoring - Остановить мониторинг"
	@echo "  make logs-monitoring - Логи мониторинга"
	@echo ""
	@echo "Этап 9: Prompt Storage"
	@echo "  make up-prompt-storage   - Запустить отдельный MLflow для Prompt Storage"
	@echo "  make down-prompt-storage - Остановить Prompt Storage"
	@echo "  make logs-prompt-storage - Логи Prompt Storage"
	@echo ""
	@echo ""

# Запуск всех профилей
up-all:
	docker compose --profile mlflow --profile airflow --profile lakefs --profile jupyterhub --profile ml-service --profile monitoring --profile prompt-storage up -d

# Остановка всех сервисов
down:
	docker compose down

# Статус контейнеров
status:
	docker compose ps

# Логи всех контейнеров
logs:
	docker compose logs -f

# ==============================
# Этап 1: MLflow
# ==============================
up-mlflow:
	docker compose --profile mlflow up -d

down-mlflow:
	docker compose --profile mlflow down

logs-mlflow:
	docker compose --profile mlflow logs -f

# ==============================
# Этап 2: Airflow
# ==============================
up-airflow:
	docker compose --profile airflow up -d

down-airflow:
	docker compose --profile airflow down

logs-airflow:
	docker compose --profile airflow logs -f

# ==============================
# Этап 3: LakeFS
# ==============================
up-lakefs:
	docker compose --profile lakefs up -d

down-lakefs:
	docker compose --profile lakefs down

logs-lakefs:
	docker compose --profile lakefs logs -f

# ==============================
# Этап 4: JupyterHub
# ==============================
up-jupyterhub:
	docker compose --profile jupyterhub up -d

down-jupyterhub:
	docker compose --profile jupyterhub down

logs-jupyterhub:
	docker compose --profile jupyterhub logs -f

# ==============================
# Этап 5: ML-сервис
# ==============================
up-ml-service:
	docker compose --profile ml-service up -d

down-ml-service:
	docker compose --profile ml-service down

logs-ml-service:
	docker compose --profile ml-service logs -f

# ==============================
# Этап 6: Мониторинг
# ==============================
up-monitoring:
	docker compose --profile monitoring up -d

down-monitoring:
	docker compose --profile monitoring down

logs-monitoring:
	docker compose --profile monitoring logs -f

# ==============================
# Этап 9: Prompt Storage
# ==============================
up-prompt-storage:
	docker compose --profile prompt-storage up -d

down-prompt-storage:
	docker compose --profile prompt-storage down

logs-prompt-storage:
	docker compose --profile prompt-storage logs -f

