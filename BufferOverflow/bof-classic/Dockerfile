FROM gcc:12.2.0

# Prepare and setup the working directory
RUN mkdir -p /app
WORKDIR /app
COPY vsnippet .
RUN gcc -o vsnippet-program-c 23-bof-classic.c

# Add a non-root user and switch to it
RUN useradd -r appuser && USER appuser

# Add a healthcheck to monitor container health
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD ["pgrep", "vsnippet-program-c"]

CMD ["./vsnippet-program-c"]