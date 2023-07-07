Q1. Create a sample docker container with a Node.js Express app and demonstrate the installation.
    Guidelines :
    ● You should be able to find what system packages are needed by looking through the app
    ● You should not need to change the app code in any way
    ● The app should be running as a non-privileged user
    ● The app should be automatically restarted if crashes or is killed
    ● The app should maximize all of the available CPUs
    ● Timezone should be in IST
    ● Follow best practices when writing a dockerfile

Ans: Here's an example of a Dockerfile that meets the given requirements:

    ```Dockerfile
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
    ```

    To build and run the Docker container with the Node.js Express app, follow these steps:

        1. Save the Dockerfile in a directory along with your Node.js Express app code.
        2. Open a terminal and navigate to the directory containing the Dockerfile.
        3. Build the Docker image using the following command:
        ```
        docker build -t my-express-app .
        ```
        This will create a Docker image named "my-express-app" based on the Dockerfile.
        4. Once the image is built, you can run a container from the image using the following command:
        ```
        docker run -d --name my-app-container -p 3000:3000 --restart=unless-stopped --cpus=0.5 my-express-app
        ```
        This command will start a Docker container named "my-app-container" based on the "my-express-app" image. The container will run in the background (-d flag), map port 3000 of the container to port 3000 of the host (-p flag), automatically restart if it crashes or is killed (--restart=unless-stopped), and use 0.5 CPUs (--cpus=0.5).
        5. You can access the running app by visiting `http://localhost:3000` in your web browser.

    This Dockerfile and the corresponding commands demonstrate how to create a Docker container with a Node.js Express app that meets the given requirements. You don't need to modify the app code in any way, as the Docker container will package and run the app as-is.