#!/bin/bash

service mariadb start 2>/dev/null

if mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "USE $MYSQL_DATABASE;" &> /dev/null; then
  kill $(cat /run/mysqld/mysqld.pid)

  mysqld
else
  echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE ;" > db1.sql
  echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> db1.sql
  echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> db1.sql
  echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" >> db1.sql
  echo "FLUSH PRIVILEGES;" >> db1.sql

  mysql < db1.sql

  kill $(cat /run/mysqld/mysqld.pid)

  mysqld
fi
