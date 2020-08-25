#FROM robinfu/php:7.4-fpm-alpine3.12-with-sockets
FROM registry.cn-hangzhou.aliyuncs.com/ulooo/php:7.4-fpm-alpine3.12-with-sockets


# copy PHP configuration to image
COPY ./.docker/php-fpm/etc/conf.d/php.local.ini /usr/local/etc/php/php.ini
COPY ./.docker/php-fpm/etc/conf.d/00-xdebug-recommended.ini /usr/local/etc/php/conf.d/00-xdebug-recommended.ini
COPY ./.docker/php-fpm/etc/conf.d/00-apcu-recommended.ini /usr/local/etc/php/conf.d/00-apcu-recommended.ini
COPY ./.docker/php-fpm/etc/conf.d/00-opcache-recommended.ini /usr/local/etc/php/conf.d/00-opcache-recommended.ini

COPY --chown=www-data:www-data ./src-magento /data/www

# set file and folder permissions
RUN chmod g+w /data/www /data/www/pub/media /data/www/pub/static /data/www/var && \
find /data/www -type f -exec chmod 644 {} \; && \
find /data/www -type d -exec chmod 755 {} \; && \
chmod -R 775 /data/www/generated \
    /data/www/bin \
    /data/www/app/etc \
    /data/www/var \
    /data/www/pub/media \
    /data/www/pub/static
