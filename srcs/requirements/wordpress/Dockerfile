FROM debian:bullseye

WORKDIR /var/www/html

COPY ./conf/wp-config.php /var/www/html

RUN apt update -y && apt upgrade -y \
    && apt install php7.4 php7.4-fpm wget -y

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz


