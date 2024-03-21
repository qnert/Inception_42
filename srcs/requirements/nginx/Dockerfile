FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx gettext-base openssl -y

COPY ./conf/default.conf /etc/nginx/conf.d/
COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 443

CMD ["setup.sh"]
