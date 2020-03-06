FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx vim php-fpm

RUN rm /etc/nginx/sites-available/default \
	&& rm /etc/nginx/sites-enabled/default

COPY ./srcs/site /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/site /etc/nginx/sites-enabled/site \
	&& mkdir /var/www/site

COPY ./srcs/index.php /var/www/site/

COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/

CMD service php7.3-fpm start \
	&& service nginx start

CMD tail -f /dev/random