FROM node:lts

WORKDIR /app

# Habilita pnpm usando corepack (solución para Node.js 20+)
RUN corepack enable

COPY package.json pnpm-lock.yaml ./

# Instala solo las dependencias de producción
RUN pnpm install --prod --frozen-lockfile

COPY . .

# Migra la base de datos con npx y luego inicia la aplicación
CMD ["sh", "-c", "npx directus database migrate:latest && pnpm start"]
