FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install vsftpd gettext-base -y

COPY ./tools/vsftp.conf /etc/vsftpd/vsftp.conf
COPY ./tools/setup.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/setup.sh

CMD ["setup.sh"]

# lcd to change the local dir and the with get(download) or put(upload)
