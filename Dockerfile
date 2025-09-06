FROM alpine:latest

LABEL Maintainer="Hilman Maulana, Ibnu Maksum, Rizki Rahmatullah"
LABEL Description="PHPNuxBill (PHP Mikrotik Billing) with PHP 7.4 on Alpine Linux."

# Setup working directory
WORKDIR /var/www/html

# Expose port
EXPOSE 80
EXPOSE 3306

# Install packages dan dependencies
RUN apk add --no-cache \
    nginx \
    php74 \
    php74-fpm \
    php74-gd \
    php74-mbstring \
    php74-mysqli \
    php74-session \
    php74-zip \
    php74-curl \
    php74-pdo \
    php74-pdo_mysql \
    mysql \
    mysql-client \
    libzip-dev \
    zip \
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

# Copy konfigurasi PHP-FPM (sesuaikan dengan PHP 7.4)
COPY conf/php-fpm.conf /etc/php74/php-fpm.d/www.conf
COPY conf/php.ini /etc/php74/conf.d/custom.ini

# Copy supervisord configuration
COPY conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Tambahkan source code aplikasi
COPY --chown=nginx:nginx src /var/www/html/

# Perintah utama container
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
