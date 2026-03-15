# Этап 9: Prompt Storage в MLflow

## Описание

Использование MLflow Prompt Engineering для версионирования промптов в LLM-приложениях.

## Требования

- Запущенный отдельный MLflow Prompt Storage (Этап 9): `make up-prompt-storage`
- MLflow версии с поддержкой Prompt Engineering
- Этап 1 (MLflow на `http://localhost:5000`) остается без изменений

## Доступ к Prompt Storage

1. Откройте MLflow UI: http://localhost:5001
2. В боковом меню найдите раздел "Prompts"
3. Если раздела нет, убедитесь, что используется актуальная версия MLflow

## Создание версий промптов

### Через веб-интерфейс

1. В разделе Prompt Engineering нажмите "Create Prompt"
2. Введите имя промпта (например, "system_prompt")
3. Введите текст промпта
4. Сохраните как версию 1
5. Создайте новую версию с измененным текстом
6. Повторите для других промптов

### Через Python API

```python
import mlflow

mlflow.set_tracking_uri("http://localhost:5001")

# Создание промпта версии 1
mlflow.llm.log_prompt(
    prompt_name="system_prompt",
    prompt_text="Как ты можешь помочь пользователю?",
    version=1
)

# Создание промпта версии 2
mlflow.llm.log_prompt(
    prompt_name="system_prompt",
    prompt_text="Как ты можешь выступать в роли экспертного ML-инженера: давать структурированные шаги, технические детали, примеры кода и MLOps-рекомендации?",
    version=2
)

# Создание другого промпта
mlflow.llm.log_prompt(
    prompt_name="user_query_template",
    prompt_text="Что можно сказать об этих данных: {data}?",
    version=1
)
```

## Примеры промптов для создания

1. **System Prompt v1**: "Как ты можешь помочь пользователю?"
2. **System Prompt v2**: "Как ты можешь помочь в задачах машинного обучения и анализа данных, объясняя всё простыми словами с примерами?"
3. **System Prompt v3**: "Как ты можешь выступать в роли экспертного ML-инженера: давать структурированные шаги, технические детали, примеры кода и MLOps-рекомендации?"
4. **User Query Template v1**: "Что можно сказать об этих данных: {data}?"
5. **User Query Template v2**: "Какие ключевые инсайты, возможные проблемы и практические рекомендации можно дать по этим данным: {data}?"

## Использование промптов

```python
import mlflow

# Загрузка конкретной версии промпта
prompt = mlflow.llm.load_prompt("system_prompt", version=2)
print(prompt)

# Использование в LLM-приложении
response = llm.chat(
    system_prompt=prompt,
    user_message="Как тренировать LLM?"
)
```

## Преимущества версионирования промптов

- Отслеживание изменений промптов
- A/B тестирование различных версий
- Откат к предыдущим версиям
- Документирование эволюции промптов
- Совместная работа над промптами

## Результаты

### Скриншоты

1. [mlflow-prompts-ui.png](results/mlflow-prompts-ui.png) - Интерфейс Prompt Engineering в MLflow
2. [mlflow-prompts-list.png](results/mlflow-prompts-list.png) - Список созданных промптов
3. [mlflow-prompt-versions.png](results/mlflow-prompt-versions.png) - Версии одного из промптов

### Логи

1. [prompt-storage-startup.log](results/prompt-storage-startup.log) - Логи запуска MLflow Prompt Storage
