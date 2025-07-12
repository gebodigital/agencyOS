FROM node:lts

WORKDIR /app

# Habilita pnpm usando corepack (solución para Node.js 20+)
RUN corepack enable

COPY package.json pnpm-lock.yaml ./

# Instala solo las dependencias de producción
RUN pnpm install --prod --frozen-lockfile

COPY . .

CMD ["tail", "-f", "/dev/null"]
