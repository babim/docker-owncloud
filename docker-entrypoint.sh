#!/bin/bash
set -e

if [ ! -e '/var/www/html/index.php' ]; then
	tar cf - --one-file-system -C /usr/src/smf . | tar xf -
	chown -R www-data /var/www/html
fi

exec "$@"
