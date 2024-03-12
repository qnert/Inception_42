FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
    && apt install mariadb-server -y

COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

CMD ["setup.sh"]
