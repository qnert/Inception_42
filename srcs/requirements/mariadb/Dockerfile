FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
    && apt install mariadb-server -y

COPY ./tools/setup.sh /usr/local/bin/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

CMD ["setup.sh"]
