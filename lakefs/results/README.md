# Результаты Этап 3: LakeFS

## Скриншоты

1. [`minio-console.png`](./minio-console.png) - MinIO Console с созданным bucket
2. [`lakefs-repositories.png`](./lakefs-repositories.png) - Список репозиториев в LakeFS
3. [`lakefs-branches.png`](./lakefs-branches.png) - Ветки репозитория (main, dev)
4. [`lakefs-commits.png`](./lakefs-commits.png) - История коммитов с добавленным файлом

## Логи

5. [`lakefs-server.log`](./lakefs-server.log) - Логи запуска LakeFS
6. [`minio.log`](./minio.log) - Логи запуска MinIO

## Как получить

### Скриншоты
1. Запустите `make up-lakefs`
2. Откройте MinIO: http://localhost:9001 (minioadmin/minioadmin123)
3. Создайте bucket: `lakefs-data`
4. Откройте LakeFS: http://localhost:8001
5. Создайте репозиторий, ветку, добавьте файл, сделайте commit
6. Сделайте скриншоты каждого шага

### Логи
```bash
docker compose --profile lakefs logs lakefs > lakefs/results/lakefs-server.log
docker compose --profile lakefs logs minio > lakefs/results/minio.log
```

