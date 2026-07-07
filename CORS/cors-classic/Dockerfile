#PHP Apache setup
FROM node:14

#Install and update system dependencies
RUN apt update -y && apt install -y supervisor npm
RUN npm install express

#Prepare and setup the working directory
WORKDIR /var/www/html/
COPY vsnippet .

#Copy configs
COPY config/supervisord.conf /etc/supervisord.conf

# Add a non-root user and switch to it
RUN useradd -r appuser && chown -R appuser /var/www/html
USER appuser

# Add a healthcheck to monitor container health
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337 || exit 1

EXPOSE 1337

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]