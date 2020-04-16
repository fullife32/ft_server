FROM debian:buster

LABEL maintainer="eassouli <eassouli@student.42.fr>"

# Update and download dependancies
RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -y install nginx mariadb-server php-fpm php-mysql php-mbstring wget

# Copy all config files
COPY ./srcs/* /root/

# phpMyAdmin installation and configuration
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz \
	&& mkdir -p /var/www/html/phpmyadmin \
	&& tar xzf /phpMyAdmin-4.9.5-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin/ \
	&& rm -rf /phpMyAdmin-4.9.5-all-languages.tar.gz \
	&& mv /root/config.default.php /var/www/html/phpmyadmin/libraries/ \
	&& chmod -R 755 /var/www/html/phpmyadmin

# Wordpress installation and configuration
RUN wget https://wordpress.org/latest.tar.gz \
	&& mkdir -p /var/www/html/wordpress \
	&& tar xzf /latest.tar.gz --strip-components=1 -C /var/www/html/wordpress/ \
	&& rm -rf /latest.tar.gz \
	&& mv /root/wp-config.php /var/www/html/wordpress/ \
	&& chmod -R 755 /var/www/html/wordpress

# Create autoindex variable
ENV AUTOINDEX=ON

# Start script
ENTRYPOINT ["bash", "/root/start.sh"]
