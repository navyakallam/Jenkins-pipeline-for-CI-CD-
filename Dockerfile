FROM node:18-alpine

WORKDIR /app

# Set a custom npm cache directory
ENV NPM_CONFIG_CACHE=/app/.npm

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

