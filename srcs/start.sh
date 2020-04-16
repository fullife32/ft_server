# Starting services
service nginx start
service mysql start
service php7.3-fpm start

# Move nginx configuration
if [ $AUTOINDEX = ON ]; then
	mv /root/nginx-on.conf /etc/nginx/sites-available/localhost
else
	mv /root/nginx-off.conf /etc/nginx/sites-available/localhost
fi
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# Configure Wordpress and phpMyAdmin database
mariadb < /root/db_conf.sql
mysql < /var/www/html/phpmyadmin/sql/create_tables.sql

# Create SSL key
mv /root/nginx-selfsigned.crt /etc/ssl/certs/
mv /root/nginx-selfsigned.key /etc/ssl/private/

# Reloading services
service nginx reload
service mysql reload
service php7.3-fpm reload

# Loop server
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
