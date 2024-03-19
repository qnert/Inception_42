#!/bin/bash

service mariadb start 2>/dev/null

sleep 5

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /run/mysqld/mysqld.pid)

mysqld
