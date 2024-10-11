FROM php:8-apache

RUN a2enmod ssl && a2enmod rewrite
RUN docker-php-ext-install mysqli
# RUN mkdir -p /etc/apache2/ssl
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# COPY ./ssl/*.pem /etc/apache2/ssl/
COPY ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./src /var/www/html

EXPOSE 80
EXPOSE 443