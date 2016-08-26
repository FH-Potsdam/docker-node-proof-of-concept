# start with a small linux node image
FROM  mhart/alpine-node:latest
# add a group for execution
RUN addgroup -S app && adduser -S -g app app
# Create app directory
ENV NODE_ENV=production
# create our working dir and set it
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# copy our files
COPY package.json /usr/src/app/
COPY index.js /usr/src/app
COPY public /usr/src/app/public
# could also be written like this
# (needed if you have paths with whitespaces)
# COPY ["package.json", "index.js", "public", "/usr/src/app/"]

# the production flag should be set by the ENV command
# install all needed modules
# if your dependencies are large this will create a large container
# to keep this smaller take a look at Dockerfile.browserify
# If you have native dependencies, you'll need extra tools
# RUN apk add --no-cache make gcc g++ python
RUN npm install --production
# the port the app uses
# will be mapped to the port set by the runner command
EXPOSE 8080
# the user that executes the app
USER app
# run that thing
# could also be a npm start command but to have as little
# footprint as possible we target it directly
CMD [ "node", "index.js" ]