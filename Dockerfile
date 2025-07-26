FROM node:18-alpine

WORKDIR /app

# Copy dependency manifests only
COPY package.json package-lock.json ./

# Install dependencies first
RUN npm install

# Copy rest of the application
COPY . .

# Build or run Strapi
CMD ["npm", "start"]
