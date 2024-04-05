#!/bin/bash

if [ ! -d "$CERTS_" ]; then
  mkdir $CERTS_
fi

chmod 700 $CERTS_

envsubst '${CERTS_} ${DOMAIN}' < "/etc/nginx/conf.d/default.conf" > "/etc/nginx/conf.d/nginx.conf"

rm -f /etc/nginx/conf.d/default.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CERTS_/key.key -out $CERTS_/certificate.crt \
      -subj "/C=DE/ST=BW/L=Heilbronn/O=42 Heilbronn/OU=IT Univeristy/CN=skunert.42.fr"

nginx -g "daemon off;"
