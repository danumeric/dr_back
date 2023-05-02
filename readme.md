## Запуск проекта
Установите docker (я использую версия для windows)
Создайте контейнер с БД:
docker-compose up -d

Установите пакеты
```
npm install
```

Создайте миграцию prisma Postgresql
```
npx prisma migrate deploy
```
Далее нужно восстановить бэкап db_backup.sql, я использую gui pgadmin
для подключения к БД.
Подключаемся к контейнеру.
databases > postgres > restore db_backup.sql

### Запускаем сервер 
```
npm start
```