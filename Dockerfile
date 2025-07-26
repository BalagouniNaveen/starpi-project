FROM node:18-alpine

WORKDIR /app

# If only package.json exists:
COPY package.json ./

# If package-lock.json exists:
# COPY package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "start"]
