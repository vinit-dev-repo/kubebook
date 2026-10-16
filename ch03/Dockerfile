FROM node:22-alpine
WORKDIR /app
COPY --chmod=0644 package.json package-lock.json ./
RUN npm ci --omit=dev
COPY --chmod=0644 index.mjs .
EXPOSE 3000
USER node
CMD ["node", "index.mjs"]
