# Build stage
FROM node:22-alpine AS builder

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

# Copiar arquivos de dependências
COPY package.json pnpm-lock.yaml ./

# Instalar dependências
RUN pnpm install --frozen-lockfile

# Copiar código-fonte
COPY . .

# Build
RUN pnpm build

# Runtime stage
FROM node:22-alpine

WORKDIR /app

# Instalar pnpm
RUN npm install -g pnpm

# Copiar package.json
COPY package.json pnpm-lock.yaml ./

# Instalar apenas dependências de produção
RUN pnpm install --prod --frozen-lockfile

# Copiar arquivos built do estágio anterior
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/client/dist ./client/dist

# Expor porta
EXPOSE 3000

# Iniciar aplicação
CMD ["npm", "start"]
