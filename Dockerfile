FROM node:argon
RUN groupadd -r app && useradd -r -g app app
ENV NODE_ENV=production
# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY index.js /usr/src/app
COPY public /usr/src/app/public
EXPOSE 8080
USER app
CMD [ "node", "index.js" ]