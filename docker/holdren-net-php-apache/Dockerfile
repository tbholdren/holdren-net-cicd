FROM php:7.2-apache

# need mysqli mod and rewrite
RUN apt-get update && apt-get install -y \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-enable mysqli \
    && a2enmod rewrite
