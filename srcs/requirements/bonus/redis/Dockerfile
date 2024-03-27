FROM debian:bullseye

RUN apt update -y \
    && apt upgrade -y \
    && apt install redis -y

COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

EXPOSE 6379

CMD ["setup.sh"]

