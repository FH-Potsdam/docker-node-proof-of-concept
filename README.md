# Docker Proof of Concept on interface.fh-potsdam.de

Proof of Concept on how build a docker container for the interface.fh-potsdam.de server

You need Docker installed to use this. Luckily there is a App for Windows & macOS. Get it at [docker.com](https://www.docker.com/). You also should install [Kitematic](https://kitematic.com/) for easier acces to your running containers.  

```bash
# Edit the package.json to reflect your project
# e.g. change the name of the container and user in 
# scripts 
#
# start docker app
# then run:  
git clone https://github.com/FH-Potsdam/docker-proof-of-concept-in-interface.fh-potsdam.de.git ./docker-poc/
cd docker-poc/
npm run docker:simple
# to get the ID of the container run
# docker ps
# to see the output run
# docker logs [CONTAINER ID]
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

## Recommended Readings

- [Dockerfile reference](https://docs.docker.com/engine/reference/builder/)
- [Dockerizing a Node.js web app Node.js](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/)
- [Best Practices for Non-root User · Issue #48 · mhart/alpine-node · GitHub](https://github.com/mhart/alpine-node/issues/48)
- [option to not install devDependencies · Issue #1434 · npm/npm · GitHub](https://github.com/npm/npm/issues/1434)
- [docker-node/BestPractices.md at master · nodejs/docker-node · GitHub](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md)
- [odino.org || Docker run your Nodejs App in 24mb of an Image](http://odino.org/minimal-docker-run-your-nodejs-app-in-25mb-of-an-image/)
- [Issues · docker/docker-bench-security · GitHub](https://github.com/docker/docker-bench-security/issues)


__nexe__

- [Docker for Mac: standard_init_linux.go:175: exec user process caused "exec format error" · Issue #23865 · docker/docker · GitHub](https://github.com/docker/docker/issues/23865)
- [deployment - How do I deploy Node.js applications as a single executable file? - Stack Overflow](http://stackoverflow.com/questions/14314038/how-do-i-deploy-node-js-applications-as-a-single-executable-file)
