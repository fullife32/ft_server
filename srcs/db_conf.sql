CREATE DATABASE wordpress_database;
GRANT ALL ON wordpress_database.* TO 'eassouli'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit