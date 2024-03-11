FROM debian:bullseye

COPY ./tools/start.html /usr/share/nginx/html/
COPY ./conf/nginx.conf /etc/nginx/conf.d/
COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh
RUN apt update -y && apt upgrade -y && apt install nginx openssl -y

EXPOSE 443
CMD ["setup.sh"]
