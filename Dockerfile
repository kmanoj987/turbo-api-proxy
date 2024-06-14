# Use a base image
FROM node:14

# Set a working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the application port
EXPOSE 3000

# Define an environment variable for the label
ARG ENV_LABEL
ENV DEFAULT_LABEL_NAME=turbo-api-proxy
LABEL environment=${DEFAULT_LABEL_NAME}-${ENV_LABEL}

# Start the application
CMD ["npm", "start"]
