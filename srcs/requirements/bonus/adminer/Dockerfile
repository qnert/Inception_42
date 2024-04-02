FROM debian:bullseye

WORKDIR /var/www/html

RUN apt update -y && \
    apt upgrade -y && \
    apt install curl php php-mysql -y

RUN curl -L -o index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN chmod 755 /var/www/html/index.php

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html/"]
