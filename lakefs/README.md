# Этап 3: LakeFS

## Описание

LakeFS для версионирования данных с использованием Git-подобного подхода (branches, commits, merges).

## Компоненты

- **LakeFS**: сервер версионирования данных
- **PostgreSQL**: хранение метаданных LakeFS
- **MinIO**: S3-совместимое объектное хранилище для данных

## Запуск

```bash
# Запуск LakeFS, PostgreSQL и MinIO
make up-lakefs

# Просмотр логов
make logs-lakefs

# Остановка
make down-lakefs
```

## Доступ

- **LakeFS UI**: http://localhost:8001
- **MinIO Console**: http://localhost:9001
  - Логин: minioadmin (по умолчанию)
  - Пароль: minioadmin123 (по умолчанию)
- **MinIO API**: http://localhost:9000

## Настройка

Переменные окружения в `.env`:
- `LAKEFS_POSTGRES_USER` - пользователь PostgreSQL (по умолчанию: lakefs)
- `LAKEFS_POSTGRES_PASSWORD` - пароль PostgreSQL
- `LAKEFS_POSTGRES_DB` - имя базы данных
- `LAKEFS_AUTH_SECRET` - секретный ключ для шифрования
- `MINIO_ROOT_USER` - пользователь MinIO (по умолчанию: minioadmin)
- `MINIO_ROOT_PASSWORD` - пароль MinIO

## Первичная настройка

1. Откройте MinIO Console: http://localhost:9001
2. Войдите с учетными данными (minioadmin/minioadmin123)
3. Создайте bucket (например, `lakefs-data`)
4. Откройте LakeFS UI: http://localhost:8001
5. При первом входе создайте учетные данные администратора
6. Создайте новый репозиторий:
   - Имя: например `ml-data-repo`
   - Storage namespace: `s3://lakefs-data/`
   - Default branch: `main`

## Работа с версиями данных

### Создание ветки

```bash
# Через CLI (lakectl)
lakectl branch create lakefs://ml-data-repo/dev --source main
```

Или через веб-интерфейс: Branches → Create Branch

### Добавление файла и коммит

1. Через UI: Upload Object
2. Добавьте файл в ветку
3. Commit changes с описанием

## Результаты

Скриншоты и логи развертывания:

- [Скриншот MinIO Console](results/minio-console.png) - интерфейс MinIO с bucket
- [Скриншот LakeFS UI - репозитории](results/lakefs-repositories.png) - список репозиториев
- [Скриншот LakeFS - ветки](results/lakefs-branches.png) - созданные ветки
- [Скриншот LakeFS - коммиты](results/lakefs-commits.png) - история коммитов
- [Логи запуска LakeFS](results/lakefs-server.log) - успешный запуск сервера
- [Логи запуска MinIO](results/minio.log) - успешный запуск MinIO
