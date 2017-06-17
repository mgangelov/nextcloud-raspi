FROM arm32v7/php:7-apache
MAINTAINER Martin Angelov "m.angelov95@gmail.com"

USER root
WORKDIR /var/www/html/

RUN apt-get update -qy && \
    apt-get install -qy \
        libgd-dev \
        libzip-dev \
        wget \
        unzip \
    && docker-php-ext-install -j$(nproc) gd zip

RUN wget https://download.nextcloud.com/server/releases/nextcloud-12.0.0.zip && \
    unzip -q nextcloud-*.zip

RUN mkdir -p /var/www/html/nextcloud/data && \
    chown www-data:www-data /var/www/html/nextcloud/data && \
    chmod 750 /var/www/html/nextcloud/data && \
    chown www-data:www-data /var/www/html/nextcloud/config && \
    chown www-data:www-data /var/www/html/nextcloud/apps

CMD ["apache2-foreground"]
