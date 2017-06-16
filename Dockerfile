FROM resin/rpi-raspbian:latest
MAINTAINER Martin Angelov "m.angelov95@gmail.com"

USER root
WORKDIR /var/www/html/


RUN apt-get -qy update && \
    apt-get -qy install --no-install-recommends \
                        curl \
                        wget \
                        unzip \
                        ca-certificates \
                        apache2 \
                        php5 \
                        php5-gd \
                        sqlite \
                        php5-sqlite \
                        php5-curl

RUN service apache2 restart

RUN wget https://download.nextcloud.com/server/releases/nextcloud-12.0.0.zip && \
    unzip -q nextcloud-*.zip

RUN mkdir -p /var/www/html/nextcloud/data && \
    chown www-data:www-data /var/www/html/nextcloud/data && \
    chmod 750 /var/www/html/nextcloud/data && \
    chown www-data:www-data /var/www/html/nextcloud/config && \
    chown www-data:www-data /var/www/html/nextcloud/apps

CMD ["yes"]
