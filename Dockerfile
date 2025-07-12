FROM node:lts

WORKDIR /app

# Habilita pnpm usando corepack (solución para Node.js 20+)
RUN corepack enable

COPY package.json pnpm-lock.yaml ./

# Instala TODAS las dependencias (incluyendo las de desarrollo como 'directus')
RUN pnpm install --frozen-lockfile

COPY . .

# Migra la base de datos y luego inicia la aplicación
CMD ["sh", "-c", "npx directus database migrate:latest && pnpm start"]
