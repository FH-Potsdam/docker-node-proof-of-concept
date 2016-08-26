FROM  mhart/alpine-node:latest
RUN addgroup -S app && adduser -S -g app app
ENV NODE_ENV=production
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# the production flag should also be set by the ENV command
# if we want a image that is as small as possible it is

COPY package.json /usr/src/app/
RUN npm install --production
COPY index.js /usr/src/app
COPY public /usr/src/app/public
EXPOSE 8080
USER app
CMD [ "node", "index.js" ]