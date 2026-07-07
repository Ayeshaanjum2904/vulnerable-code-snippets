FROM python:3

# Install and update system dependencies
RUN apt update -y; apt install -y supervisor
RUN pip install flask requests

# Prepare and setup the working directory
RUN mkdir -p /app
WORKDIR /app
COPY vsnippet .
COPY config/supervisord.conf /etc/supervisord.conf

EXPOSE 1337

# Disable pycache
ENV PYTHONDONTWRITEBYTECODE=1

# Add non-root user and switch to it
RUN useradd -r appuser
USER appuser

# Add HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337/health || exit 1

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]