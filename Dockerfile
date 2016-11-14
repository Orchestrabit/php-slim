FROM php:7-apache

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev
RUN docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt
RUN a2enmod rewrite

COPY config/php.ini /usr/local/etc/php/php.ini
COPY config/apache2.conf /etc/apache2/apache2.conf
COPY config/000-default.conf /etc/apache2/sites-available/000-default.conf
