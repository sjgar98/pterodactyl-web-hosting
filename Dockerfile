# ----------------------------------
# Pterodactyl Webserver
# Environment: Alpine
# ----------------------------------

FROM php:8-apache

RUN apt-get update \
 && apt-get install --assume-yes \
      7zip
RUN docker-php-ext-install mysqli
RUN a2enmod rewrite headers expires

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /home/container

COPY default_files /usr/local/default_files
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/ash", "/entrypoint.sh"]
