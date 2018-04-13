#!/bin/sh
set -e

# run composer install
if [ ! -d "/var/www/xingstation-api/vendor" ]; then
  cd /var/www/xingstation-api
  composer install
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

supervisord -c /etc/supervisord.conf


exec "$@"