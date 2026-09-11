FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine AS runner
RUN addgroup -g 10001 app && adduser -u 10001 -G app -s /bin/sh -D appuser
WORKDIR /app
COPY --from=builder --chown=appuser:app /app/dist ./dist
USER appuser
EXPOSE 3000
CMD ["node", "dist/index.js"]
