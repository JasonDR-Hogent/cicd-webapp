# Start from a Docker image for Node.js 18.x.x (LTS)
FROM node:18.17.0
# The application should be reachable on port 3000
EXPOSE 3000

#Copy the package.json and yarn.lock files to the container and 
WORKDIR /app
COPY package.json /app
COPY yarn.lock /app

#then run the yarn install command. 
RUN yarn install
# Thereafter, copy the application code to the container.
# Copy the application code in the /app folder in the container
COPY . /app
# Install the application dependencies with the yarn install --frozen-lockfile command
RUN yarn install --frozen-lockfile
# The application should be started using the yarn start command (when the container is started)
CMD ["yarn", "start"]