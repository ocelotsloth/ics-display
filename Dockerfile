FROM php:7.0-apache

COPY Dockerfile /Dockerfile
COPY LICENSE /LICENSE
COPY README.md /README.md

COPY config/php.ini /usr/local/etc/php/
COPY src/ /var/www/html/

RUN apt-get update && apt-get install -y \
    git \
 && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && cd /var/www/html \
 && composer install --no-interaction
