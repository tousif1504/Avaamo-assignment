# Use a Node.js base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install system dependencies
RUN apk add --no-cache tini

# Install Node.js dependencies
RUN npm ci --only=production

# Copy the app code to the container
COPY . .

# Set the environment variables
ENV TZ=Asia/Kolkata
ENV NODE_ENV=production

# Expose the port on which the app will run
EXPOSE 3000

# Run the app using Tini as the entrypoint
ENTRYPOINT ["/sbin/tini", "--"]

# Start the Node.js Express app
CMD ["node", "app.js"]
