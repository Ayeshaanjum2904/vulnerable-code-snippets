#PHP Apache setup
FROM php:8.2-apache

#Install and update system dependencies
RUN apt update -y; apt install -y supervisor apache2

#Create a non-root user and switch to it
RUN useradd -r appuser
USER appuser

#Prepare and setup the working directory
WORKDIR /var/www/html/
COPY vsnippet .

#Copy configs
COPY config/supervisord.conf /etc/supervisord.conf
COPY config/apache.conf /etc/apache2/sites-enabled/apache.conf

EXPOSE 1337

#Add a HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337 || exit 1

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]