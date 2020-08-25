FROM registry.cn-hangzhou.aliyuncs.com/ulooo/nginx:1.17.6-alpine

# copy NGINX configuration to image
COPY ./.docker/nginx/etc/nginx.conf /etc/nginx/nginx.conf
COPY ./.docker/nginx/etc/snippets /etc/nginx/snippets

RUN mkdir /data && mkdir /data/nginx && mkdir /data/nginx/logs

# copy src/public folder to NGINX
COPY ./src-magento/pub /data/www/pub

# set folder permissions
RUN find /data/www -type d -exec chmod 755 {} \;
