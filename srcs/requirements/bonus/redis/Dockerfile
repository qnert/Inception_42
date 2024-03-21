FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt install redis-server php-redis -y

COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

CMD ["setup.sh"]

