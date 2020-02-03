FROM php:7.3-apache

RUN apt-get update -y && apt-get install -y libpng-dev

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev 

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install gd

RUN a2enmod rewrite

RUN chmod 777 -R -c /var/www
