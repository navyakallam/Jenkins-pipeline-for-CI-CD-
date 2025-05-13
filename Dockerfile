FROM node:18-alpine

WORKDIR /app

# Set a custom npm cache directory
ENV NPM_CONFIG_CACHE=/app/.npm

COPY package*.json ./

RUN npm install
RUN chown -R node:node /app

COPY . .

EXPOSE 3000
USER node

CMD ["node", "index.js"]

