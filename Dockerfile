FROM alpine:latest

LABEL Maintainer="Hilman Maulana, Ibnu Maksum, Rizki Rahmatullah"
LABEL Description="PHPNuxBill (PHP Mikrotik Billing) with PHP 8.1 on Alpine Linux."

# Setup document root
WORKDIR /var/www/html

# Expose port
EXPOSE 80
EXPOSE 3306

# Install packages dan dependencies
RUN apk add --no-cache \
    nginx \
    php81 \
    php81-fpm \
    php81-gd \
    php81-mbstring \
    php81-mysqli \
    php81-session \
    php81-zip \
    php81-curl \
    php81-pdo \
    php81-pdo_mysql \
    mysql \
    mysql-client \
    libzip-dev \
    zip \
    unzip\
    supervisor \
    && apk add --no-cache --virtual .build-deps \
       build-base \
       zlib-dev \
       libzip-dev \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip \
    && apk del .build-deps

# Copy konfigurasi nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy konfigurasi MySQL
COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/mysql.sh /app/mysql.sh
RUN chmod +x /app/mysql.sh

# Copy konfigurasi PHP-FPM (sesuaikan dengan PHP 8.1)
COPY conf/php-fpm.conf /etc/php81/php-fpm.d/www.conf
COPY conf/php.ini /etc/php81/conf.d/custom.ini

# Copy supervisord configuration
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Tambahkan source code aplikasi
COPY --chown=nginx:nginx src /var/www/html/

# Perintah utama container
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
