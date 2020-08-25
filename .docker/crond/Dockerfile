#FROM robinfu/php:7.4-cli-alpine3.12-with-sockets
FROM registry.cn-hangzhou.aliyuncs.com/ulooo/php:7.4-cli-alpine3.12-with-sockets

# copy PHP configuration to image
COPY ./.docker/crond/etc/php/php.ini /usr/local/etc/php/php.ini

COPY --chown=www-data:www-data ./src-magento /data/www

ADD ./.docker/crond/etc/crontabs/www-data /etc/cron.d/www-data
RUN chmod 0644 /etc/cron.d/www-data && crontab -u www-data /etc/cron.d/www-data
