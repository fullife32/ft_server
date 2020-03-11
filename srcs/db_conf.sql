CREATE DATABASE wordpress;
GRANT ALL ON wordpress.* TO 'eassouli'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE DATABASE phpmyadmin;
GRANT ALL ON phpmyadmin.* TO 'eassouli'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit