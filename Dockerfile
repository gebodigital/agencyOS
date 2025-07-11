FROM node:lts

WORKDIR /app

# Habilita pnpm usando corepack (solución para Node.js 20+)
RUN corepack enable

COPY package.json pnpm-lock.yaml ./

RUN pnpm install --prod --frozen-lockfile

COPY . .

# CMD ["sh", "-c", "pnpm directus database migrate:latest && pnpm start"]
CMD ["tail", "-f", "/dev/null"]
