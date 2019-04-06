FROM php:7.3.2-fpm-alpine3.8

RUN apk add --no-cache  \
        nano \
        git \
        sudo \
        zsh \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql \
    && docker-php-ext-install pdo_mysql

WORKDIR /var/www/gianiaz

## Utente non-root (no sudo)
RUN adduser -D -u 1000 gianiaz -G www-data \
    && mkdir -p /home/gianiaz \
    && chown -R gianiaz /home/gianiaz \
    && chown -R gianiaz /var/www/gianiaz

COPY docker/fpm/etc/ /usr/local/etc/php/

RUN curl -sS https://getcomposer.org/installer | php -- \
        --install-dir=/usr/local/bin \
        --version=1.8.4 \
        --filename=composer


 ## Add sudo capabilities
RUN echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default \
    && chmod 0440 /etc/sudoers.d/default

RUN apk add --no-cache --virtual .xdebug-build-deps $PHPIZE_DEPS \
    && pecl install -o xdebug-2.7.0 \
    && docker-php-ext-enable xdebug \
    && apk del .xdebug-build-deps \
    && pecl clear-cache

COPY docker/fpm/etc/ /usr/local/etc/php/
COPY docker/fpm/conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

USER gianiaz

 ## ZSH / OhMyZsh
COPY --chown=gianiaz:www-data docker/fpm/zsh/install-zsh.sh /home/gianiaz/install-zsh.sh
RUN chmod +x /home/gianiaz/install-zsh.sh \
    && /home/gianiaz/install-zsh.sh
COPY docker/fpm/zsh/zsh-config.sh /home/gianiaz/.zshrc
ENV TERM xterm-256color





RUN composer global require --no-suggest --no-interaction hirak/prestissimo \
    && rm -rf ~/.composer/cache
