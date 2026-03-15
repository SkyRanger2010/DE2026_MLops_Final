# Этап 6: Мониторинг (Prometheus + Grafana)

## Описание

Система мониторинга ML-сервиса с использованием Prometheus для сбора метрик и Grafana для визуализации.

## Компоненты

- **Prometheus**: сбор и хранение метрик
- **Grafana**: визуализация метрик через дашборды
- **ML-сервис**: endpoint /metrics для экспорта метрик

## Запуск

```bash
# Запуск Prometheus и Grafana
make up-monitoring

# Также нужен запущенный ML-сервис
make up-ml-service

# Просмотр логов
make logs-monitoring

# Остановка
make down-monitoring
```

## Доступ

- **Prometheus UI**: http://localhost:9090
- **Grafana UI**: http://localhost:3000
  - Логин: admin (по умолчанию)
  - Пароль: admin (по умолчанию)

## Метрики ML-сервиса

Сервис экспортирует следующие метрики через endpoint `/metrics`:

- `ml_predictions_total` - общее количество предсказаний
- `ml_prediction_errors_total` - количество ошибок при предсказаниях
- `ml_prediction_duration_seconds` - длительность предсказаний (гистограмма)
- `ml_active_requests` - количество активных запросов

## Настройка Grafana

1. Откройте http://localhost:3000
2. Войдите с учетными данными admin/admin
3. Добавьте Data Source:
   - Type: Prometheus
   - URL: http://prometheus:9090
   - Access: Server (default)
   - Save & Test
4. Создайте новый Dashboard
5. Добавьте панели с запросами:
   - `rate(ml_predictions_total[5m])` - количество предсказаний в секунду
   - `ml_prediction_duration_seconds` - латентность предсказаний
   - `ml_prediction_errors_total` - количество ошибок
   - `ml_active_requests` - активные запросы

## Пример запросов Prometheus

```promql
# Количество предсказаний в секунду за последние 5 минут
rate(ml_predictions_total[5m])

# 95-й перцентиль латентности
histogram_quantile(0.95, rate(ml_prediction_duration_seconds_bucket[5m]))

# Процент ошибок
rate(ml_prediction_errors_total[5m]) / rate(ml_predictions_total[5m]) * 100
```

## Настройка

Переменные окружения в `.env`:
- `GRAFANA_ADMIN_USER` - пользователь Grafana (по умолчанию: admin)
- `GRAFANA_ADMIN_PASSWORD` - пароль Grafana (по умолчанию: admin)

## Результаты

Скриншоты и логи развертывания:

- [Скриншот Prometheus Targets](results/prometheus-targets.png) - статус scrape targets
- [Скриншот Prometheus Graph](results/prometheus-graph.png) - пример запроса метрик
- [Скриншот Grafana Data Source](results/grafana-datasource.png) - подключенный Prometheus
- [Скриншот Grafana Dashboard](results/grafana-dashboard.png) - дашборд с метриками ML-сервиса
- [Экспорт дашборда](results/grafana-dashboard.json) - JSON дашборда для импорта
