FROM ubuntu:22.04
MAINTAINER andrew.dl@outlook.com

RUN apt-get update
RUN apt-get install -y nginx

COPY ./site-content/index.html /usr/share/nginx/html/index.html
EXPOSE 80


