FROM debian:bullseye

RUN mkdir -p /var/www/html

COPY ./tools/start.html /var/www/html/index.html

RUN echo "Successfully copied html file!"

CMD ["tail", "-f", "/dev/null"]
