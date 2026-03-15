# Результаты Этап 4: JupyterHub

## Скриншоты

1. [`jupyterhub-login.png`](./jupyterhub-login.png) - Страница входа JupyterHub
2. [`jupyterhub-lab.png`](./jupyterhub-lab.png) - Интерфейс JupyterLab
3. [`jupyterhub-notebook.png`](./jupyterhub-notebook.png) - Запущенный notebook с примером кода

## Логи

4. [`jupyterhub-startup.log`](./jupyterhub-startup.log) - Логи запуска JupyterHub

## Дополнительно

5. [`lakefs_example.ipynb`](./lakefs_example.ipynb) - Пример ноутбука для работы с LakeFS (requests + lakefs-client)

## Как получить

### Скриншоты
1. Запустите `make up-jupyterhub`
2. Откройте http://localhost:8000
3. Войдите (admin/password)
4. JupyterLab откроется автоматически
5. Создайте новый notebook, напишите и выполните код
6. Сделайте скриншоты

### Логи
```bash
docker compose --profile jupyterhub logs jupyterhub > jupyterhub/results/jupyterhub-startup.log
```

