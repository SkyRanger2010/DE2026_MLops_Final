# Этап 4: JupyterHub

## Описание

JupyterHub для организации многопользовательской среды разработки с Jupyter notebooks.

## Компоненты

- **JupyterHub**: многопользовательский сервер Jupyter
- **Configurable HTTP Proxy**: прокси для маршрутизации запросов к пользовательским серверам
- **JupyterLab**: современный интерфейс Jupyter

## Запуск

```bash
# Запуск JupyterHub
make up-jupyterhub

# Просмотр логов
make logs-jupyterhub

# Остановка
make down-jupyterhub
```

## Доступ

- **JupyterHub**: http://localhost:8000
- **Логин**: admin (или любое другое имя пользователя)
- **Пароль**: password (по умолчанию, можно изменить в .env)

## Настройка

Переменные окружения в `.env`:
- `JUPYTERHUB_CRYPT_KEY` - ключ для шифрования (генерируется через `openssl rand -hex 32`)
- `JUPYTERHUB_DUMMY_PASSWORD` - пароль для DummyAuthenticator (по умолчанию: password)

## Аутентификация

Используется `DummyAuthenticator` для упрощенной аутентификации (подходит для демо/разработки). Можно войти с любым именем пользователя, используя установленный пароль.

Для продакшена следует использовать PAMAuthenticator, LDAPAuthenticator или OAuth.

## Проверка работы

1. Откройте http://localhost:8000
2. Войдите как `admin` с паролем `password`
3. Запустите JupyterLab (откроется автоматически)
4. Создайте новый notebook и выполните простой код:
   ```python
   print("Hello from JupyterHub!")
   ```

## Результаты

Скриншоты и логи развертывания:

- [Скриншот страницы входа](results/jupyterhub-login.png) - форма входа
- [Скриншот JupyterLab](results/jupyterhub-lab.png) - интерфейс JupyterLab
- [Скриншот запущенного notebook](results/jupyterhub-notebook.png) - пример работающего notebook
- [Логи запуска сервера](results/jupyterhub-startup.log) - успешный запуск
- [Пример ноутбука LakeFS](results/lakefs_example.ipynb) - notebook с примерами requests и lakefs-client
