#!/bin/bash

# mapping host ip
DOCKERHOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
echo "$DOCKERHOST_IP dockerhost" >> /etc/hosts
echo "$APACHE_MOD_PROXY" > /usr/local/apache2/conf/extra/httpd-proxy.conf
echo "$APACHE_ACCESS_CONTROL" > /usr/local/apache2/conf/extra/httpd-access-control.conf

exec "$@"
