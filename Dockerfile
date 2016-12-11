FROM babim/phpbase:5fpm

ENV PHPBB_VERSION 3.1.10

RUN curl -fsSL -o /usr/src/phpbb.zip \
		"https://www.phpbb.com/files/release/phpBB-${PHPBB_VERSION}.zip"
RUN if [ -f "/entrypoint.sh" ]; then mv /entrypoint.sh /run.sh; fi
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www
ENTRYPOINT ["/entrypoint.sh"]
CMD ["php-fpm"]
