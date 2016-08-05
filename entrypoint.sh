#!/bin/bash
set -e

# mapping host ip
DOCKERHOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
echo "$DOCKERHOST_IP dockerhost" >> /etc/hosts
printf "$APACHE_MOD_PROXY" >> /usr/local/apache2/conf/extra/httpd-proxy.conf

exec "$@"
