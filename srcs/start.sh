# Create localhost server
mv /root/localhost /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# PHP info index
mv /root/info.php /var/www/html/

# phpMyAdmin installation and configuration
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz
mkdir /var/www/html/phpmyadmin
tar xzf /phpMyAdmin-4.9.4-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin/
rm -rf /phpMyAdmin-4.9.4-all-languages.tar.gz
mv /root/config.default.php /var/www/html/phpmyadmin/libraries/
chmod -R 755 /var/www/html/phpmyadmin

# Wordpress installation and configuration
wget https://wordpress.org/latest.tar.gz
mkdir /var/www/html/wordpress
tar xzf /latest.tar.gz --strip-components=1 -C /var/www/html/wordpress/
rm -rf /latest.tar.gz
mv /root/wp-config.php /var/www/html/wordpress/
chmod -R 755 /var/www/html/wordpress

# Configure Wordpress and phpMyAdmin database
mariadb < /root/db_conf.sql
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql

# Starting services
service nginx start
service mysql start
service php7.3-fpm start

# Loop server
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
