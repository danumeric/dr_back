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
Далее нужно восстановить бэкап БД, я использую gui pgadmin.
Подключаемся к контейнеру.
databases > postgres > restore backupDB.sql

### Запускаем сервер 
```
npm start
```