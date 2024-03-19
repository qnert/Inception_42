FROM debian:bullseye

WORKDIR /var/www/html

COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh
RUN apt update -y && apt upgrade -y \
    && apt install php-fpm php-mysql curl -y

EXPOSE 9000

CMD ["setup.sh"]
