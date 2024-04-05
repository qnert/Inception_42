FROM debian:bullseye

COPY ./tools/setup.sh /usr/local/bin/

RUN apt update -y \
  && apt upgrade -y \
  && apt install -y curl tar

RUN curl -L -o portainer.tar.gz https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz \
  && tar -zxvf portainer.tar.gz \
  && rm portainer.tar.gz
RUN chmod +x /usr/local/bin/setup.sh
RUN chmod +x ./portainer/portainer

EXPOSE 9000

CMD ["setup.sh"]
