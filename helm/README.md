# Этап 8: Helm Chart

## Описание

Helm chart для развертывания ML-сервиса в Kubernetes с настраиваемыми параметрами.

## Структура chart

```
helm/ml-service/
├── Chart.yaml           # Метаданные chart
├── values.yaml          # Значения по умолчанию
└── templates/
    ├── deployment.yaml  # Шаблон Deployment
    ├── service.yaml     # Шаблон Service
    └── ingress.yaml     # Шаблон Ingress
```

## Установка

```bash
# Установка chart с именем релиза "ml-service-release"
helm install ml-service-release ./helm/ml-service

# Установка с переопределением значений
helm install ml-service-release ./helm/ml-service \
  --set image.tag=2.0.0 \
  --set replicaCount=3
```

## Обновление

```bash
# Обновление релиза
helm upgrade ml-service-release ./helm/ml-service

# Обновление с новой версией образа
helm upgrade ml-service-release ./helm/ml-service \
  --set image.tag=2.0.0

# Обновление ресурсов
helm upgrade ml-service-release ./helm/ml-service \
  --set resources.requests.cpu=200m \
  --set resources.requests.memory=512Mi
```

## Удаление

```bash
# Удаление релиза
helm uninstall ml-service-release
```

## Настраиваемые параметры

### Образ

```yaml
image:
  repository: ml-service  # Docker registry и имя образа
  tag: "1.0.0"           # Версия образа
  pullPolicy: IfNotPresent
```

**Пример:**
```bash
helm upgrade ml-service-release ./helm/ml-service \
  --set image.repository=myregistry.io/ml-service \
  --set image.tag=2.1.0
```

### Ресурсы

```yaml
resources:
  requests:
    cpu: 100m      # Минимальные требования CPU
    memory: 256Mi  # Минимальные требования памяти
  limits:
    cpu: 500m      # Максимальный CPU
    memory: 512Mi  # Максимальная память
```

**Пример:**
```bash
helm upgrade ml-service-release ./helm/ml-service \
  --set resources.requests.cpu=200m \
  --set resources.limits.cpu=1000m \
  --set resources.requests.memory=512Mi \
  --set resources.limits.memory=1Gi
```

### Реплики

```yaml
replicaCount: 2  # Количество подов
```

**Пример:**
```bash
helm upgrade ml-service-release ./helm/ml-service --set replicaCount=5
```

### Ingress

```yaml
ingress:
  enabled: true
  className: nginx
  host: ml-service.local
```

## Использование values файла

Создайте файл `values-prod.yaml`:

```yaml
replicaCount: 5

image:
  tag: "2.0.0"

resources:
  requests:
    cpu: 200m
    memory: 512Mi
  limits:
    cpu: 1000m
    memory: 1Gi

ingress:
  host: ml-service.example.com
```

Установка с кастомными values:
```bash
helm install ml-service-release ./helm/ml-service -f values-prod.yaml
```

## Проверка

```bash
# Список установленных релизов
helm list

# Статус релиза
helm status ml-service-release

# Получить values релиза
helm get values ml-service-release

# Получить манифесты релиза
helm get manifest ml-service-release

# История релиза
helm history ml-service-release
```

## Проверка chart

```bash
# Рендеринг шаблонов без установки
helm template ml-service-release ./helm/ml-service

# Dry-run установки
helm install ml-service-release ./helm/ml-service --dry-run --debug
```

## Результаты

Скриншоты и логи развертывания:

- [Скриншот helm list](results/helm-list.png) - список установленных релизов
- [Скриншот helm status](results/helm-status.png) - статус релиза
- [Скриншот helm status после обновлений](results/helm-status-after-upgrades.png) - итоговый статус релиза после `helm upgrade`
- [Скриншот kubectl get pods](results/helm-pods.png) - поды, развернутые через Helm
- [Вывод helm template](results/helm-template.yaml) - отрендеренные манифесты
- [Пример values-prod.yaml](results/values-prod.yaml) - пример production values
- [Лог helm install](results/helm-install.log) - вывод установки релиза
- [Лог helm upgrade image](results/helm-upgrade-image.log) - вывод обновления тега образа
