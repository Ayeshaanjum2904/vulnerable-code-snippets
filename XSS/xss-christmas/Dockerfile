FROM node:18

WORKDIR /usr/src/app

COPY vsnippet/package*.json ./

RUN npm install --only=production && \
    npm install --save-dev nodemon && \
    npm install escape-html

COPY vsnippet/ .

EXPOSE 1337

ENV NODE_ENV=production

RUN useradd -r appuser && USER appuser

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD curl -f http://localhost:1337 || exit 1

CMD ["node", "index.js"]