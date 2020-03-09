#!bin/sh/

service nginx start
service mysql start
service php7.3-fpm start

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz \
mv /phpMyAdmin-4.9.4-all-languages/* /var/www/html/phpmyadmin/ \
rm /phpMyAdmin-4.9.4-all-languages.tar.gz \
rm -rf /phpMyAdmin-4.9.4-all-languages

tail /var/log/nginx/access.log /var/log/nginx/error.log
