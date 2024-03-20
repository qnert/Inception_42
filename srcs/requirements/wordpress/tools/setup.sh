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

wp core install --url=$DOMAIN --title="Inception" \
                 --admin_user=$WORDPRESS_ADMIN_USER \
                 --admin_password=$WORDPRESS_ADMIN_PASSWORD \
                 --admin_email=$WORDPRESS_ADMIN_EMAIL \
                 --skip-email \
                 --allow-root

wp user create Simon simon@42.fr \
              --user_pass=42 \
              --allow-root

mkdir /run/php

php-fpm7.4 -F
