#!/bin/bash
set -e

touch /usr/local/apache2/conf/extra/httpd-proxy.conf
touch /usr/local/apache2/conf/extra/httpd-access-control.conf

rm /usr/local/apache2/conf/extra/httpd-proxy.conf
rm /usr/local/apache2/conf/extra/httpd-access-control.conf

# mapping host ip
DOCKERHOST_IP=$(netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}')
echo "$DOCKERHOST_IP dockerhost" >> /etc/hosts
echo -e "$APACHE_MOD_PROXY" >> /usr/local/apache2/conf/extra/httpd-proxy.conf
echo -e "$APACHE_ACCESS_CONTROL" >> /usr/local/apache2/conf/extra/httpd-access-control.conf

exec "$@"
