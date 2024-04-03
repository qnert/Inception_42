FROM debian:bullseye

RUN apt update -y \
  && apt upgrade -y \
  && apt install python3 python3-pip -y

RUN mkdir -p /var/www/html

COPY ./tools/start.html /var/www/html/index.html
COPY ./tools/profile.jpg /var/www/html/
COPY ./tools/server.py /

RUN echo "Successfully copied html file!"

EXPOSE 8085

CMD ["python3", "/server.py"]
