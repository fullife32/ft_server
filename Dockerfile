FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx \
	&& apt-get -y install mariadb-server \
	&& apt-get -y install php-fpm php-mysql \
	&& apt-get -y install wget

COPY ./srcs/* /root/

ENTRYPOINT ["bash", "/root/start.sh"]
