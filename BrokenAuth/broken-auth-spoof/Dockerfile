FROM golang:1.20

#Install and update system dependencies
RUN apt update -y && apt install -y supervisor

#Prepare and setup the working directory
RUN mkdir -p /app
WORKDIR /app
COPY vsnippet .
COPY config/supervisord.conf /etc/supervisord.conf

EXPOSE 1337

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337 || exit 1

USER appuser

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]