FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx mariadb-server php-fpm php-mysql php-mbstring wget

ENV AUTOINDEX=ON

COPY ./srcs/* /root/

ENTRYPOINT ["bash", "/root/start.sh"]
