# Docker Node.js Proof of Concept

Proof of concept on how build a docker container for Node.js apps.  
This is just for learning a bit about docker. There might be 🐜🐛🐞🕷🐝 and 🐲🐉🀄.  

__Makes use of:__  

[![](http://dockeri.co/image/mhart/alpine-node)](https://hub.docker.com/r/mhart/alpine-node/)  

__License:__  

[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://fabiantheblind.mit-license.org/)

----

You need Docker installed to use this. Luckily there is a App for Windows & macOS. Get it at [docker.com](https://www.docker.com/). You also should install [Kitematic](https://kitematic.com/) for easier acces to your running containers.  

```bash
# Edit the package.json to reflect your project
# e.g. change the name of the container and user in 
# scripts 
#
# start docker app
# then run:  
git clone https://github.com/FH-Potsdam/docker-node-proof-of-concept.git ./docker-poc/
cd docker-poc/
npm run docker:simple
# to get the ID of the container run
# docker ps
# to see the output run
docker logs [CONTAINER ID]

# see the package.json scripts how they are used in this project
```

open: [localhost:61428](http://localhost:61428) to see the express app.  

The above commands:

- build a basic the docker image 
- execute the docker container defined in `Dockerfile`

To have a smaller container you can bundle all your *.js files into a single one. This can be done by running:  

```bash
npm run docker:browserify
```

it will:

- build the basic image
- bundle the js files into a single bundle.js file using browserify
- remove the node_modules folder
- execute the container defined in `Dockerfile.browserify`

Note: There might be problems with native modules. If so fall back to the simple build.  

to clean up after you run:  

```bash
# stops all containers
# removs them
# removes all images created by these commands
# npm run docker:browserify
# npm run docker:simple
npm run remove
```


Use this as a boilerplate to build node apps that run on the server.

## Useful Docker commands

```bash
# list all images
docker images
# list all containers
docker ps
# remove a container
docker rm [CONTAINER ID or TAG]
# reomve an image
docker rmi [IMAGE ID OR TAG]
# stop all running containers
docker stop $(docker ps -a -q)
#
# see what your app is logging
docker logs [CONTAINER ID]

# build from docker file not called Dockerfile
# -t is the tag -f is the filename
#
#  the last argument is the working directory root
docker build -t [USER]/[FANCY NAME] -f My-Special-Dockerfile-name ./
#
# run a container with some useful settings
# 
# -p is the port to map first is the actual port second the port the node app uses
# 
# -e sets some environment variables
# 
# -m the max memory 
# Memory limit (format: <number>[<unit>]). Number is a positive integer. Unit can be one of b, k, m, or g. Minimum is 4M.
# 
# --memory-swap
# Total memory limit (memory + swap, format: <number>[<unit>]). Number is a positive integer. Unit can be one of b, k, m, or g.
# 
# -d sets detached mode
# To start a container in detached mode, you use -d=true or just -d option. By design, containers started in detached mode exit when the root process used to run the container exits. A container in detached mode cannot be automatically removed when it stops, this means you cannot use the --rm option with -d option.
#
docker run -p 61428:8080 -u "app" -e "NODE_ENV=production" -m "300M" --memory-swap "1G" -d user/fancy-name
```


## Recommended Readings

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Dockerizing a Node.js web app Node.js](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
- [Best Practices for Non-root User · Issue #48 · mhart/alpine-node · GitHub](https://github.com/mhart/alpine-node/issues/48)
- [option to not install devDependencies · Issue #1434 · npm/npm · GitHub](https://github.com/npm/npm/issues/1434)
- [docker-node/BestPractices.md at master · nodejs/docker-node · GitHub](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md)
- [odino.org || Docker run your Nodejs App in 24mb of an Image](http://odino.org/minimal-docker-run-your-nodejs-app-in-25mb-of-an-image/)
- [Issues · docker/docker-bench-security · GitHub](https://github.com/docker/docker-bench-security/issues)


__nexe (Not working yet)__


- [Docker for Mac: standard_init_linux.go:175: exec user process caused "exec format error" · Issue #23865 · docker/docker · GitHub](https://github.com/docker/docker/issues/23865)
- [deployment - How do I deploy Node.js applications as a single executable file? - Stack Overflow](http://stackoverflow.com/questions/14314038/how-do-i-deploy-node-js-applications-as-a-single-executable-file)
