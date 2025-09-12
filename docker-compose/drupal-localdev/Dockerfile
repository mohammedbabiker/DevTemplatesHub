FROM drupal:11-apache

WORKDIR /opt/drupal

RUN rm /etc/apt/preferences.d/no-debian-php

RUN a2enmod rewrite

ADD config/php.ini /usr/local/etc/php/php.ini

RUN apt-get update && apt-get install -y --no-install-recommends \
    git unzip libicu-dev libzip-dev vim \
    libpng-dev libjpeg-dev curl \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j$(nproc) intl gd zip bcmath \
    && pecl install redis \
    && docker-php-ext-enable redis

RUN composer require drush/drush

RUN composer require drupal/redis