FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install vim wget \
	&& apt-get -y install nginx \
	&& apt-get -y install php-fpm \
	&& apt-get -y install mariadb-server

COPY ./srcs /root/

COPY ./srcs/localhost /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

COPY ./srcs/index.php /var/www/html/

COPY ./srcs/www.conf /etc/php/7.3/fpm/pool.d/

ENTRYPOINT ["bash", "/root/run.sh"]
