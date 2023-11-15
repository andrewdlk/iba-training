1. Через volume подкинуть конфиг в nginx контейнер, чтобы на страничке в браузере появилась слово Docker (либо через curl это проверить).
2. То же самое сделать через docker-compose.

1. % docker run --rm -d -p 8080:80 --name web -v ./site-content:/usr/share/nginx/html nginx
2. % cd docker; vim docker-compose.yml; docker-compose up -d --remove-orphans  (предыдущие проекты с таким именем без этой опции не позволяют выполнить запуск проекта) 


