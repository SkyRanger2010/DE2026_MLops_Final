# Результаты Этап 9: Prompt Storage в MLflow

## Скриншоты

1. [`mlflow-prompts-ui.png`](./mlflow-prompts-ui.png) - Интерфейс Prompt Engineering в MLflow
2. [`mlflow-prompts-list.png`](./mlflow-prompts-list.png) - Список созданных промптов
3. [`mlflow-prompt-versions.png`](./mlflow-prompt-versions.png) - Версии одного из промптов

## Логи

1. [`prompt-storage-startup.log`](./prompt-storage-startup.log) - Логи запуска MLflow Prompt Storage

## Как получить

### Скриншоты
1. Запустите сервис Prompt Storage: `make up-prompt-storage`
2. Откройте http://localhost:5001
3. Найдите раздел "Prompts"
4. Создайте несколько версий промптов:
   - system_prompt (v1, v2, v3)
   - user_query_template (v1, v2)
5. Сделайте скриншоты интерфейса

### Логи
```bash
docker compose --profile prompt-storage logs --no-color mlflow-prompt-storage > prompt-storage/results/prompt-storage-startup.log
```
