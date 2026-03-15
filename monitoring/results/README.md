# Результаты Этап 6: Мониторинг

## Скриншоты

1. [`prometheus-targets.png`](./prometheus-targets.png) - Status → Targets, `ml-service` в состоянии `UP`
2. [`grafana-datasource.png`](./grafana-datasource.png) - Настроенный Data Source (Prometheus)
3. [`grafana-dashboard.png`](./grafana-dashboard.png) - Дашборд с метриками ML-сервиса

## Дополнительно

1. [`prometheus-graph.png`](./prometheus-graph.png) - График метрики в Prometheus
2. [`grafana-dashboard.json`](./grafana-dashboard.json) - Экспорт дашборда (JSON)
3. [`ml-service-metrics.txt`](./ml-service-metrics.txt) - Снимок endpoint `/metrics`
4. [`prometheus-targets.json`](./prometheus-targets.json) - JSON ответ API `targets`
5. [`prometheus.log`](./prometheus.log) - Логи Prometheus
6. [`grafana.log`](./grafana.log) - Логи Grafana

## Как получить

### Скриншоты

1. Запустите `make up-ml-service` и `make up-monitoring`
2. Сгенерируйте трафик (см. TESTING.md)
3. Prometheus: [http://localhost:9090](http://localhost:9090) → Status → Targets
4. Grafana: [http://localhost:3000](http://localhost:3000)
  - Добавьте Data Source: Prometheus ([http://prometheus:9090](http://prometheus:9090))
  - Создайте Dashboard с панелями
5. Сделайте скриншоты

### Экспорт дашборда

1. В Grafana откройте дашборд
2. Dashboard settings (шестеренка) → JSON Model
3. Скопируйте JSON в файл `grafana-dashboard.json`

