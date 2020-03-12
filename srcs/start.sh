# Starting services
service nginx start
service mysql start
service php7.3-fpm start

# Create localhost server
mkdir /var/www/localhost
chown -R $USER:$USER /var/www/localhost
mv /root/localhost /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# Nginx index
mv /root/index.nginx-debian.html /var/www/localhost/

# PHP info index
mv /root/info.php /var/www/localhost/

# phpMyAdmin installation and configuration
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.4/phpMyAdmin-4.9.4-all-languages.tar.gz
mkdir /var/www/localhost/phpmyadmin
tar xzf /phpMyAdmin-4.9.4-all-languages.tar.gz --strip-components=1 -C /var/www/localhost/phpmyadmin/
rm -rf /phpMyAdmin-4.9.4-all-languages.tar.gz
mv /root/config.default.php /var/www/localhost/phpmyadmin/libraries/

# Wordpress installation and configuration
wget https://wordpress.org/latest.tar.gz
mkdir /var/www/localhost/wordpress
tar xzf /latest.tar.gz --strip-components=1 -C /var/www/localhost/wordpress/
rm -rf /latest.tar.gz
mv /root/wp-config.php /var/www/localhost/wordpress/

# Configure Wordpress and phpMyAdmin database
mariadb < /root/db_conf.sql
mysql < /var/www/localhost/phpmyadmin/sql/create_tables.sql

# Reload services
service nginx reload

# Loop server
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
