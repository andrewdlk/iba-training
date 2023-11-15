1. Через volume подкинуть конфиг в nginx контейнер, чтобы на страничке в браузере появилась слово Docker (либо через curl это проверить).
2. То же самое сделать через docker-compose.

docker run --rm -d -p 8080:80 --name web -v ./site-content:/usr/share/nginx/html nginx
docker-compose 
