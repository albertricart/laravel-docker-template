FROM php:8.1-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache $PHPIZE_DEPS \
	&& pecl install xdebug-3.1.2 \
	&& docker-php-ext-enable xdebug \
    && echo "xdebug.mode = develop,debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.start_with_request = yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_port = 9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.log=/tmp/xdebug.log" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini 
    # && echo "xdebug.discover_client_host = 1" >> /etc/php/8.0/mods-available/xdebug.ini \