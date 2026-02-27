FROM node:20-slim

WORKDIR /app

# Install dependencies
COPY package.json .
RUN npm install --no-fund --no-audit

# Copy application
COPY . .

# Build frontend (if needed)
# RUN npm run build

EXPOSE 3000

CMD ["node", "server.js"]