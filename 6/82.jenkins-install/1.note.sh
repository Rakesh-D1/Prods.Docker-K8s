                              DIND 1

Explanation of the Docker compose YAML file

services:
  jenkins-docker:
    image: docker:dind
    container_name: jenkins-docker
    privileged: true
    environment:
      - DOCKER_TLS_CERTDIR=/certs
    volumes:
      - jenkins-docker-certs:/certs/client
      - jenkins-data:/var/jenkins_home
    ports:
      - "2376:2376"
    networks:
      jenkins:
        aliases:
          - docker
    command: --storage-driver overlay2


Here we are installing the Docker DIND
   image: docker:dind
By adding this image we are getting a dokcer D (server) it also called the sidecar. 

WHY WE NEED THE DIND CONTAINER?

Now the jenkins we have configured , we want that jenkins ned to build the docker images. We will write scte PAC in jenkinsfile to build the 
images by taking the code from the github.
Till now we did the docker run , dokcer build manually but now the jenkins will build the entire CICD pipeline.

Now once we start the jenkins, the secoud step is to build the pipeline, it will take the code from the github & create a docker image.
From that Docker Image the docker container will run post testing push to the docker hub.

All these tasks we need to dockerrize , but the jenkins itself running in the container

CHALLENGES WITH SOLUTION:
jenkins running inside a contianer & how it runs other docker command ?

1st Solution 
    By using the Docker socket Binding
    We have /var/run/dockersocket: (This daemon is already nunning on the Host ) Connect this with the container damenon /var/run/dockersocket
    /var/run/dockersocket:/var/run/dockersocket

    Here the container will directly speaks with the host docker daemon. THis is verfy unsecure way to work & give a full contrlo on the host
    docker ... It will be a security compromise the attakcer have the host docker path to manipulate the other conatiner changes as well

2nd Solution
    DIND it will run a separate docker daemon in a separate container, no in other container the Jenkins will run & it will speak with the DIND 
    container .
    In jenkins container only the Docker CLI is installed

