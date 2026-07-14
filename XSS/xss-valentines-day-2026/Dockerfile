FROM python:3.14-alpine

# Create user and group with specific UID:GID
RUN addgroup -g 1000 vsnippet && \
    adduser -D -u 1000 -G vsnippet vsnippet

# Prepare and setup the working directory
RUN mkdir -p /app
WORKDIR /app
COPY vsnippet .

# Install Python packages
RUN pip install -r requirements.txt

# Change ownership of app directory to vsnippet user
RUN chown -R vsnippet:vsnippet /app

EXPOSE 1337

# Add HEALTHCHECK instruction to monitor container health
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337/health || exit 1

# Switch to the vsnippet user
USER vsnippet

ENTRYPOINT [ "python3", "/app/app.py"]