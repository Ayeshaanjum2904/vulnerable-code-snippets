FROM gcc:12.2.0

#Prepare and setup the working directory
RUN mkdir -p /app
WORKDIR /app
COPY vsnippet .
RUN gcc -o vsnippet-program-c 23-bof-classic.c

HEALTHCHECK CMD ["/bin/sh", "-c", "pgrep vsnippet-program-c || exit 1"]

USER appuser

CMD ["./vsnippet-program-c"]
