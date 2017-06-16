FROM resin/rpi-raspbian:latest
MAINTAINER Martin Angelov "m.angelov95@gmail.com"

USER root

RUN apt-get -qy update && \
    apt-get -qy install --no-install-recommends \
                        curl \
                        unzip \
                        ca-certificates \
                        apache2 \
                        php5 \
                        php5-gd \
                        sqlite \
                        php5-sqlite \
                        php5-curl

RUN service apache2 restart

CMD ["yes"]
