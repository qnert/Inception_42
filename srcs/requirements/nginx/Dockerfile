FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx openssl -y

COPY ./conf/nginx.conf /etc/nginx/conf.d/
COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 443

CMD ["setup.sh"]
