#!/bin/bash

mkdir /etc/nginx/ssl
chmod 700 /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/key.key -out /etc/nginx/ssl/certificate.crt \
      -subj "/C=DE/ST=BW/L=Heilbronn/O=42 Heilbronn/OU=IT Univeristy/CN=skunert.42.fr"

echo "server{
  listen 443 ssl;
  server_name $DOMAIN;
  index start.html;

  ssl_certificate /etc/nginx/ssl/certificate.crt;
  ssl_certificate_key /etc/nginx/ssl/key.key;
  ssl_protocols TLSv1.3;
}" > /etc/nginx/conf.d/main.conf

nginx -g "daemon off;"
