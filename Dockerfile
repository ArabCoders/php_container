FROM php:8.1-fpm-alpine

ENV IN_DOCKER=1

LABEL maintainer="admin@arabcoders.org"

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/bin/

RUN mv "${PHP_INI_DIR}/php.ini-production" "${PHP_INI_DIR}/php.ini" && chmod +x /usr/bin/install-php-extensions && \
    sync && install-php-extensions opcache xhprof redis && \
    apk add --no-cache nginx nano curl procps net-tools iproute2 shadow runuser sqlite redis && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer