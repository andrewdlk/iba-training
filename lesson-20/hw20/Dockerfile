FROM php:8.2-apache

COPY ./index.php /var/www/html/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]

LABEL maintainer="Made by Andrew DL"
LABEL description="Dockerfile for Ubuntu 22.04, PHP 8.2, Apache 2.4"