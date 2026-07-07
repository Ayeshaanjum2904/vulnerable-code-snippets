FROM golang:1.20

# Install and update system dependencies
RUN apt update -y && apt install -y supervisor

# Create a non-root user and switch to it
RUN useradd -r appuser && mkdir -p /app && chown appuser:appuser /app
USER appuser

# Prepare and setup the working directory
WORKDIR /app
COPY vsnippet .
COPY config/supervisord.conf /etc/supervisord.conf

# Add a HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337/health || exit 1

EXPOSE 1337

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]