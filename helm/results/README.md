# Результаты Этап 8: Helm

## Скриншоты

1. [`helm-list.png`](./helm-list.png) - Вывод `helm list`
2. [`helm-status.png`](./helm-status.png) - Вывод `helm status ml-service-release`
3. [`helm-pods.png`](./helm-pods.png) - Поды, развернутые через Helm
4. [`helm-status-after-upgrades.png`](./helm-status-after-upgrades.png) - Скриншот итогового статуса релиза после обновлений

## Файлы логов/шаблонов

5. [`helm-template.yaml`](./helm-template.yaml) - Вывод `helm template ml-service-release ./helm/ml-service`
6. [`values-prod.yaml`](./values-prod.yaml) - Пример production values
7. [`helm-install.log`](./helm-install.log) - Результат `helm install`
8. [`helm-upgrade-image.log`](./helm-upgrade-image.log) - Результат `helm upgrade --set image.tag=2.0.0`

## Как получить

### Скриншоты
1. Убедитесь, что K8s кластер запущен
2. Установите chart:
   ```bash
   helm install ml-service-release ./helm/ml-service
   ```
3. Выполните команды и сделайте скриншоты:
   ```bash
   helm list
   helm status ml-service-release
   kubectl get pods
   ```

### Файлы
```bash
# Рендеринг шаблонов
helm template ml-service-release ./helm/ml-service > helm/results/helm-template.yaml

# Установка и обновления
helm install ml-service-release ./helm/ml-service > helm/results/helm-install.log 2>&1
helm upgrade ml-service-release ./helm/ml-service --set image.tag=2.0.0 > helm/results/helm-upgrade-image.log 2>&1
helm status ml-service-release
```

