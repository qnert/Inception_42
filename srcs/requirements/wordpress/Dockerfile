FROM debian:bullseye

WORKDIR /var/www/html

RUN apt update -y && apt upgrade -y \
    && apt install php-fpm php-mysql curl systemctl -y

COPY ./tools/setup.sh /usr/local/bin/
COPY ./tools/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/index.php /var/www/html/

RUN chmod +x /usr/local/bin/setup.sh

CMD ["setup.sh"]
