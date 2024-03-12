FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
    && apt install mariadb-server -y \
    && apt install software-properties-common dirmngr gnupg2 -y \
    && apt install apt-transport-https wget curl -y

COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 3306

CMD ["setup.sh"]
