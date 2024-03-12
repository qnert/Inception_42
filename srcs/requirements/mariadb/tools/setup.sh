#!/bin/bash

service mariadb start &

sleep 5

MYSQL_ROOT_PASSWORD=$(echo -n "$MYSQL_ROOT_PASSWORD" | sed -e 's/^[ \t]*//;s/[ \t]*$//')

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" &

tail -f /dev/null
