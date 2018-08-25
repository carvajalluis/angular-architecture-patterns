FROM node:latest

LABEL maintainer="luisalbcarvajal@gmail.com"

WORKDIR /app
# Get all the code needed to run the app
COPY . /app

# Copy dependency definitions
# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /app && cp -a /tmp/node_modules /app/

EXPOSE 4200


CMD [ "npm", "start" ]
