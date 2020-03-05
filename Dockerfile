FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx
	
CMD service nginx start \
	&& tail -f /dev/null