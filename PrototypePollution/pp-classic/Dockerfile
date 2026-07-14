FROM node:14

# Install and update system dependencies
RUN apt update -y && apt install -y supervisor npm
RUN npm install express ejs

# Prepare and setup the working directory
WORKDIR /app
COPY vsnippet .

# Copy configs
COPY config/supervisord.conf /etc/supervisord.conf

# Add non-root user and switch to it
RUN useradd -r appuser
USER appuser

# Add HEALTHCHECK instruction
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337/health || exit 1

EXPOSE 1337

ENTRYPOINT [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]