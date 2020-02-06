FROM php:7.3-apache

RUN apt-get update -y && apt-get install -y libpng-dev \
    zlib1g-dev \
    libxrender1 \
    libfontconfig1 \
    libxext6 \
    wget

RUN docker-php-ext-install mysqli pdo pdo_mysql mbstring gd

RUN cd ~ \
    && wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz  \
    && tar vxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
    && cp wkhtmltox/bin/wk* /usr/local/bin/ 

RUN a2enmod rewrite

RUN chmod 777 -R -c /var/www
