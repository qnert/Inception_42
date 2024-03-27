FROM debian:bullseye

WORKDIR /var/www/html

RUN apt update -y && \
    apt upgrade -y && \
    apt install curl php php-mysql -y

COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 80

CMD ["setup.sh"]
