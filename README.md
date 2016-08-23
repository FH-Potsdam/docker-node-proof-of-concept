# Docker Proof of Concept on interface.fh-potsdam.de

Proof of Concept on how build a docker container for the interface.fh-potsdam.de server

You need Docker installed to use this. Luckily there is a App for Windows & macOS. Get it at [docker.com](https://www.docker.com/). You also should install [Kitematic](https://kitematic.com/).  

    # Edit the package.json to reflect your project
    # e.g. change the name of the container and user in 
    # scripts build and docker
    #
    # start docker app
    # then run:  
    git clone https://github.com/FH-Potsdam/docker-proof-of-concept-in-interface.fh-potsdam.de.git ./docker-poc/
    cd docker-poc/
    npm install
    npm run build
    # to get the ID of the container run
    docker ps
    # to see the output run
    docker logs [CONTAINER ID]
    # open: http://localhost:61428 to see the express app

Use this as a boilerplate to build node apps that run on the server.

