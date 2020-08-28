FROM alpine:3.12

RUN apk add --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ php7 php7-session php7-pecl-redis php7-pecl-apcu php7-gettext php7-fpm php7-mbstring php7-ctype php7-dom php7-gd php7-iconv php7-json php7-xml php7-xmlreader php7-xmlwriter php7-posix php7-zlib php7-zip php7-curl php7-fileinfo php7-opcache php7-openssl php7-mcrypt php7-ldap php7-intl php7-pdo_mysql php7-mysqli php7-mysqlnd php7-simplexml php7-imagick php7-exif php7-pcntl php7-gmp php7-ftp php7-bcmath php7-phar &&\
    addgroup -g 82 www-data &&\
    addgroup -g 101 nginx &&\
    adduser -h /var/lib/php7 -D -u 100 -G nginx -s /bin/false nginx &&\
    addgroup nginx www-data &&\
    rm -rf /var/cache/apk/*

COPY files/etc/php7 /etc/php7

#HEALTHCHECK --start-period=10s --interval=30s --timeout=30s --retries=10 CMD curl -f http://localhost/index.php:80 || exit 1

CMD ["php-fpm7", "-F"]
