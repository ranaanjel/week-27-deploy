FROM oven/bun:alpine

WORKDIR /app

COPY ./packages ./packages
COPY ./package.json ./package.json
COPY ./bun.lock ./bun.lock
COPY ./packages ./packages
COPY ./turbo.json ./turbo.json


COPY ./apps/http ./apps/http

RUN bun install
RUN bun install npm
RUN bun run db:generate

EXPOSE 3000

# CMD ["bun", "run", "index.ts"]
CMD ["bun", "run", "be:run"]