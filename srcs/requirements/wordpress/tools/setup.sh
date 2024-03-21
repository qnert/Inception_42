#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

wp config create \
    --dbname=$WORDPRESS_DB_NAME \
    --dbuser=$WORDPRESS_DB_USER \
    --dbpass=$WORDPRESS_DB_PASSWORD \
    --dbhost=$WORDPRESS_DB_HOST \
    --allow-root
chmod 644 wp-config.php
chmod 644 /etc/php/7.4/fpm/pool.d/www.conf

wp core install --url=$DOMAIN --title="Inception" \
                 --admin_name=$WORDPRESS_ADMIN_USER \
                 --admin_password=$WORDPRESS_ADMIN_PASSWORD \
                 --admin_email=$WORDPRESS_ADMIN_EMAIL \
                 --skip-email \
                 --allow-root

wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_USER_EMAIL \
              --user_pass=$WORDPRESS_DB_PASSWORD \
              --allow-root

mkdir /run/php

php-fpm7.4 -F
