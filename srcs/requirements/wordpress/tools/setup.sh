#!/bin/bash

sleep 5

if ! command -v wp &> /dev/null; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ ! -f /var/www/html/wp-settings.php ]; then
    wp core download --allow-root
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD \
        --dbhost=$WORDPRESS_DB_HOST \
        --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    chmod 644 /var/www/html/wp-config.php
fi

if ! wp core is-installed --allow-root; then
    wp core install --url=$DOMAIN --title="Inception" \
                     --admin_name=$WORDPRESS_ADMIN_USER \
                     --admin_password=$WORDPRESS_ADMIN_PASSWORD \
                     --admin_email=$WORDPRESS_ADMIN_EMAIL \
                     --skip-email \
                     --allow-root

    wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_USER_EMAIL \
                  --user_pass=$WORDPRESS_DB_PASSWORD \
                  --allow-root
fi

if [ ! -d /run/php ]; then
  mkdir -p /run/php
fi

php-fpm7.4 -F
