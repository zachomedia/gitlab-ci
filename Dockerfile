FROM docker
MAINTAINER William Hearn <sylus1984@gmail.com>

RUN apk add --no-cache --update -t .deps ca-certificates curl

RUN curl -Lo /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    curl -Lo glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk && \
    curl -Lo glibc-bin.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-bin-2.23-r3.apk && \
    apk add glibc.apk glibc-bin.apk

RUN curl -Lo docker-compose https://github.com/docker/compose/releases/download/1.8.1/docker-compose-Linux-x86_64 && \
    chmod +x docker-compose && \
    mv docker-compose /usr/local/bin

RUN apk upgrade -U && \
    apk --update --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main add \
    bash \
    git \
    libressl \
    make \
    tar

RUN apk upgrade -U && \
    apk --update --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community add \
    php7 \
    php7-xml \
    php7-xsl \
    php7-pdo_mysql \
    php7-mcrypt \
    php7-curl \
    php7-json \
    php7-fpm \
    php7-phar \
    php7-openssl \
    php7-mysqli \
    php7-ctype \
    php7-opcache \
    php7-mbstring \
    php7-zip \
    php7-zlib

RUN ln -s /etc/php7 /etc/php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm && \
    ln -s /usr/lib/php7 /usr/lib/php && \
    rm -fr /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer
