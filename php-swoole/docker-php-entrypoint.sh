#!/bin/sh
set -e

# run composer install
if [ ! -d "/var/www/xingstation-publication/vendor" ]; then
  cd /var/www/xingstation-publication
  composer install
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

supervisord -c /etc/supervisord.conf


exec "$@"