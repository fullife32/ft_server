FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx vim php-fpm

COPY ./srcs/site /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/site /etc/nginx/sites-enabled/site \
	&& mkdir /var/www/site

COPY ./srcs/index.php /var/www/site/

CMD service nginx restart

CMD tail -f /dev/null