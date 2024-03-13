#!/bin/bash

service mariadb start

sleep 5

echo "CREATE DATABASE IF NOT EXISTS mymaria;" > db1.sql
echo "CREATE USER IF NOT EXISTS'$MYSQL_USER'@'localhost' identified by '$MYSQL_PASSWORD';" >> db1.sql
echo "GRANT ALL on mymaria.* to '$MYSQL_USER'@'localhost';" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

kill $(cat /run/mysqld/mysqld.pid)

mysqld
