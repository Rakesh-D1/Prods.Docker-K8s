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
Here the jenkins is not running
