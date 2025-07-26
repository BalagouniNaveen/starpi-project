# Use a Node.js base image for Strapi
FROM node:18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and yarn.lock/package-lock.json to install dependencies
# Using a separate step for copying package.json allows Docker to cache this layer
# if dependencies haven't changed, speeding up builds.
COPY package.json yarn.lock ./

# Install production dependencies
# The --production flag ensures only necessary dependencies for runtime are installed.
RUN yarn install --production

# Copy the rest of the application code into the container
# This includes your Strapi project files, configurations, etc.
COPY . .

# Expose the default port Strapi runs on (1337)
# This informs Docker that the container will listen on this port.
EXPOSE 1337

# Define the command to run when the container starts
# This will start your Strapi application.
CMD ["yarn", "start"]
