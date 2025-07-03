FROM oven/bun:alpine

WORKDIR /app

COPY ./package.json ./package.json
COPY ./turbo.json .
COPY ./packages ./packages

COPY ./apps/ws ./apps/ws

RUN bun install
RUN bun install npm
RUN bun run db:generate

EXPOSE 8080

CMD ["bun", "run", "ws:run"]
# CMD ["ls"]