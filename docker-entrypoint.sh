#!/bin/bash
set -e

if [ -z "`ls /usr/local/etc/php/conf.d`" ] 
then
	cp -R /etc-start/php/conf.d/ /usr/local/etc/php/conf.d
fi
if [ ! -e '/var/www/html/wp-login.php' ]; then
	tar xvf /usr/src/wordpress.tar.gz -C /var/www/
	mv /var/www/wordpress/ /var/www/html/ && mv /var/www/wordpress/.* /var/www/html/
	chown -R www-data /var/www/html
fi

exec "$@"
