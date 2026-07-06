FROM gcc:11.3.0

#Prepare and setup the working directory
RUN mkdir -p /app
WORKDIR /app
COPY vsnippet .
RUN gcc -o vsnippet-program-c 23-bof-classic.c

USER appuser

CMD ["./vsnippet-program-c"]
