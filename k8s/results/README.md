# Результаты Этап 7: Kubernetes

## Скриншоты

1. [`k8s-pods.png`](./k8s-pods.png) - Вывод `kubectl get pods -l app=ml-service`
2. [`k8s-services.png`](./k8s-services.png) - Вывод `kubectl get services`
3. [`k8s-ingress.png`](./k8s-ingress.png) - Вывод `kubectl get ingress`
4. [`k8s-pod-describe.png`](./k8s-pod-describe.png) - Вывод `kubectl describe pod` с секциями probes

## Логи

5. [`k8s-apply.log`](./k8s-apply.log) - Вывод команды `kubectl apply -f k8s/`
6. [`k8s-pod-logs.log`](./k8s-pod-logs.log) - Логи приложения из Kubernetes pod

## Как получить

### Скриншоты
1. Запустите K8s кластер (minikube/kind/Docker Desktop)
2. Соберите и загрузите образ:
   ```bash
   docker build -t ml-service:1.0.0 ./ml-service
   minikube image load ml-service:1.0.0
   ```
3. Примените манифесты:
   ```bash
   kubectl apply -f k8s/
   ```
4. Выполните команды и сделайте скриншоты:
   ```bash
   kubectl get pods -l app=ml-service
   kubectl get services
   kubectl get ingress
   kubectl describe pod -l app=ml-service
   ```

### Логи
```bash
kubectl apply -f k8s/ > k8s/results/k8s-apply.log 2>&1
kubectl logs -l app=ml-service --tail=120 > k8s/results/k8s-pod-logs.log
```

## Дополнительно

7. [`k8s-pods-wide.png`](./k8s-pods-wide.png) - Скриншот `kubectl get pods -l app=ml-service -o wide`
8. [`k8s-ingress-controller-pods.png`](./k8s-ingress-controller-pods.png) - Скриншот `kubectl get pods -n ingress-nginx`
9. [`k8s-health-response.png`](./k8s-health-response.png) - Скриншот ответа `/health` через `port-forward`
10. [`k8s-predict-response.png`](./k8s-predict-response.png) - Скриншот ответа `/api/v1/predict` через `port-forward`

### Команды для скриншотов терминала
```bash
kubectl get pods -l app=ml-service -o wide
kubectl get pods -n ingress-nginx
kubectl port-forward service/ml-service 8888:80
curl http://localhost:8888/health
curl -X POST "http://localhost:8888/api/v1/predict" -H "Content-Type: application/json" -d '{"features":[1.5,2.3,3.7]}'
```

