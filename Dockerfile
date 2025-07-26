FROM node:18-alpine

WORKDIR /app

# Copy dependency files first
COPY package.json package-lock.json* ./

RUN npm install

# Copy rest of code
COPY . .

EXPOSE 1337

CMD ["npm", "start"]
