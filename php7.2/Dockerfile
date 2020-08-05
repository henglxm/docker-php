FROM php:7.2-fpm-alpine3.9

LABEL maintainer="hengoye@sina.cn"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache --virtual .build-deps \
    git \
    autoconf \
    supervisor \
    gcc \
    libc-dev \
    make \
    icu-dev \
    libressl-dev \
    pcre-dev \
    zlib-dev \
    libzip \
    libzip-dev \
    linux-headers \
    curl \
    curl-dev \
    gnupg \
    libxslt-dev \
    gd-dev \
    openssl-dev \
    libffi-dev \
    freetype-dev \
    sqlite-dev \
    libjpeg-turbo-dev \
    postgresql-dev \
    imap-dev && \
    docker-php-ext-configure gd \
      --with-gd \
      --with-freetype-dir=/usr/include/ \
      --with-png-dir=/usr/include/ \
      --with-jpeg-dir=/usr/include/ &&\
    docker-php-ext-configure imap --with-imap-ssl && \
    docker-php-ext-install pdo_mysql pgsql pdo_pgsql mysqli gd exif intl xsl soap zip opcache pcntl imap && \
    #pecl install xdebug-2.7.2 && \
    pecl install -o -f redis && \
    pecl install -o -f mongodb && \
    pecl install -o -f yar && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    mv composer.phar /usr/bin/composer && \
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ && \
    composer global require hirak/prestissimo && \
    echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini && \
    echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/mongodb.ini && \
    echo "extension=yar.so" > /usr/local/etc/php/conf.d/ymongodbar.ini && \
    sed -i "s|;*listen\s*=\s*127.0.0.1:9000|listen = 9000|g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i "s|;*pm.max_children\s*=\s*5|pm.max_children = 100|g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i "s|;*request_slowlog_timeout\s*=\s*0|request_slowlog_timeout = 2|g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i "s|;*slowlog\s*=\s*log/\$pool.log.slow|slowlog = /phplog/\$pool.log.slow|g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i "s|;*pm.max_requests\s*=\s*500/|pm.max_requests = 500|g" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i "s|;error_log\s*=\s*log/php-fpm.log|error_log = /phplog/error_log|g" /usr/local/etc/php-fpm.conf

ADD scripts/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
