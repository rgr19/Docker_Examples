
FROM debian:8.5
MAINTAINER Robert Grzelka "robert.grzelka@outlook.com"
RUN apt-get update
RUN apt-get install -y nginx
RUN echo 'Default page. Nginx is in your container.' > /usr/share/nginx/html/index.html

EXPOSE 80
