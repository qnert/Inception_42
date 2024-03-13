#!/bin/bash

if [ ! -d "$CERTS_" ]; then
  mkdir $CERTS_
fi

chmod 700 $CERTS_

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTS_/key.key -out $CERTS_/certificate.crt \
      -subj "/C=DE/ST=BW/L=Heilbronn/O=42 Heilbronn/OU=IT Univeristy/CN=skunert.42.fr"

echo "server{
  listen 443 ssl;
  server_name $DOMAIN;
  index start.html;

  ssl_certificate $CERTS_/certificate.crt;
  ssl_certificate_key $CERTS_/key.key;
  ssl_protocols TLSv1.3;
}" > /etc/nginx/conf.d/main.conf

nginx -g "daemon off;"
