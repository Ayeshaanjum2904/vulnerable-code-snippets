#PHP Apache setup
FROM php:8.2-apache

#Install and update system dependencies
RUN apt update -y; apt install -y supervisor apache2

#Create non-root user
RUN useradd -r appuser

WORKDIR /var/www/html/

#Prepare and setup the working directory
WORKDIR /var/www/html/
COPY vsnippet .
RUN mkdir tmp

#Copy configs
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/php-custom.ini /usr/local/etc/php/conf.d
COPY config/apache.conf /etc/apache2/sites-enabled/apache.conf

#Load Apache module(s):
RUN a2enmod speling

#Give permission:
RUN chown -R www-data /var/www/html/

EXPOSE 1337

#Add HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337/ || exit 1

#Switch to non-root user
USER appuser

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]