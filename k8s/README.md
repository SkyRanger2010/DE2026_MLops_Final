# Этап 7: Kubernetes манифесты

## Описание

Kubernetes манифесты для развертывания ML-сервиса в кластере с настроенными probes и Ingress.

## Компоненты

- **Deployment**: конфигурация подов ML-сервиса с пробами
- **Service**: внутренний сервис для доступа к подам
- **Ingress**: внешний доступ к сервису через HTTP
- **Secret**: хранение чувствительных данных (database URL)

## Подготовка

1. Убедитесь, что у вас запущен Kubernetes кластер (minikube, kind, Docker Desktop, etc.)
2. Соберите и запушьте Docker образ ML-сервиса:
   ```bash
   docker build -t ml-service:1.0.0 ./ml-service
   # Для minikube:
   minikube image load ml-service:1.0.0
   # Для kind:
   kind load docker-image ml-service:1.0.0
   ```

## Применение манифестов

```bash
# Создание namespace (опционально)
kubectl create namespace ml-service

# Применение манифестов
kubectl apply -f k8s/secret.yaml
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml

# Проверка статуса
kubectl get pods
kubectl get services
kubectl get ingress
```

## Проверка работы

### Проверка подов

```bash
# Статус подов
kubectl get pods -l app=ml-service

# Логи пода
kubectl logs -f deployment/ml-service

# Описание пода (включая события и probes)
kubectl describe pod -l app=ml-service
```

### Проверка Probes

Deployment настроен с тремя типами проб:

1. **Startup Probe**: проверяет запуск приложения (10 попыток по 5 секунд)
2. **Readiness Probe**: проверяет готовность принимать трафик (каждые 10 секунд)
3. **Liveness Probe**: проверяет работоспособность (каждые 20 секунд)

Все пробы используют endpoint `/health`.

### Доступ к сервису

```bash
# Port-forward для локального доступа
kubectl port-forward service/ml-service 8888:80

# Тестовый запрос
curl -X POST "http://localhost:8888/api/v1/predict" \
     -H "Content-Type: application/json" \
     -d '{"features": [1.5, 2.3, 3.7]}'
```

### Доступ через Ingress

Для работы Ingress нужен установленный Ingress Controller (например, nginx-ingress).

```bash
# Для minikube
minikube addons enable ingress

# Добавьте запись в /etc/hosts (Linux/Mac) или C:\Windows\System32\drivers\etc\hosts (Windows)
<MINIKUBE_IP> ml-service.local

# Доступ к сервису
curl http://ml-service.local/
```

## Ресурсы

Для pod'ов настроены requests и limits:
- **Requests**: CPU 100m, Memory 256Mi, Ephemeral Storage 256Mi
- **Limits**: CPU 500m, Memory 512Mi, Ephemeral Storage 512Mi

Эти значения можно настроить в зависимости от нагрузки.

## Масштабирование

```bash
# Ручное масштабирование
kubectl scale deployment ml-service --replicas=3

# Горизонтальное автомасштабирование (HPA)
kubectl autoscale deployment ml-service --cpu-percent=70 --min=2 --max=10
```

## Результаты

Скриншоты и логи развертывания:

- [Скриншот kubectl get pods](results/k8s-pods.png) - запущенные поды
- [Скриншот kubectl get services](results/k8s-services.png) - сервисы
- [Скриншот kubectl get ingress](results/k8s-ingress.png) - Ingress конфигурация
- [Скриншот kubectl describe pod](results/k8s-pod-describe.png) - детали пода с проверками
- [Скриншот доступа через Ingress](results/k8s-ingress-access.png) - запрос через Ingress
- [Логи применения манифестов](results/k8s-apply.log) - вывод kubectl apply
