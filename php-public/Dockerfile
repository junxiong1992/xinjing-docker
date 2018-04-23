FROM php:7.1-fpm-alpine
MAINTAINER Larryzhang <zhangyang@jingfree.com>
# modify the repo to aliyun
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories
RUN apk --no-cache add curl git  openssh openssl pcre-dev tini bash vim  freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev  libmcrypt-dev supervisor libxml2-dev autoconf g++ make  openssl-dev automake  libtool
COPY composer /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

RUN pecl update-channels
RUN docker-php-source extract
RUN pecl install redis && \
  docker-php-ext-install pcntl && \
  docker-php-ext-enable redis && \
  docker-php-ext-install mysqli && \
  docker-php-ext-install pdo && \
  docker-php-ext-install pdo_mysql && \
  docker-php-ext-install tokenizer && \
  docker-php-ext-install opcache && \
  docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ && \
  docker-php-ext-install  gd && \
  docker-php-ext-configure xmlrpc \
    --with-libxml-dir=/usr/include/ && \
  docker-php-ext-install xmlrpc && \
  docker-php-ext-install mcrypt && \
  docker-php-source delete
RUN pecl install mongodb
RUN docker-php-ext-enable mongodb
RUN docker-php-ext-install zip


ADD ./laravel.ini /usr/local/etc/php/conf.d
ADD ./laravel.pool.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini
##TODO copy supervisor config
COPY ./docker-php-entrypoint.sh /usr/local/bin/docker-php-entrypoint
RUN chmod 0777 /usr/local/bin/docker-php-entrypoint

#COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN echo '*       *       *       *       *       php /var/www/xingstation-public/artisan schedule:run >> /dev/null 2>&1' >> /var/spool/cron/crontabs/root 2>&1
RUN crond

WORKDIR /var/www/xingstation-public

