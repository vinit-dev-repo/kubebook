FROM node:22-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --no-audit --no-fund
COPY *.mjs ./
USER node
CMD ["node", "worker.mjs"]
