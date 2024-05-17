- [Мониторинг Celery](https://habr.com/ru/companies/domclick/articles/804535/) - как встроить prom-мониторинг в Celery, пользуясь только его событиями

Чек-лист:
- flower
- acks_late
- dlx
- reject_on_worker_lost
- приоритезация очередей
- явно задавать кол-во потоков
- таймауты на соединение и паблишер
- WORKER_MAX_TASKS_PER_CHILD
- таймауты

Мониторинг в кубе:
- `["bash", "-c", "cat /proc/net/tcp | grep ':1628 01'"]` - установлено соединение с кроликом
- `["bash", "-c", "celery -A app inspect ping --destination celery@$HOSTNAME"]` - проверка связи
