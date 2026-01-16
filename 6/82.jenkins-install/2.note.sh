                                             DIND 2

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


- Here we are asking Jenkin pipeline to build images  
- Docker meant with two parts CLI & the DOCKERD
- whenever we call any docker cmmadn we call it from CLI
- How the setup in the machine the blueprint is HOST >> My-jenkins container >> Jenkins-dokcer container.
- In My-jenkins container the jenikis container is there , here the jenkins software will run additionaly the docker cli will installed
- In Jenkins-dokcer container we install the docker serrver or dockerd .
- we can install the jenkin software & the dockerd in a single container if any issue come then both will get corrupt.
- To make the Jenkins plugins, Creds etc as persisitean we need to create the docker volume persistant
- My-jenkins container will conect to Jenkins-dokcer container on the port tcp://docker:2376 
- In My-jenkins container  Env variables we declare that 
- For networking between the containers & connect to the ports Docker compose internally handle the netowrk
- Jenkins-dokcer in jenkins docker will recive the build command. pull base image , pull the code & build the image.
- Post the jenkins give the command to build It will in the storage in defined store.
- we can install the dockerd in the Jenkins-dokcer container but the issue is dockerd wtihout linux kernel it cant build any image or container
  to it need the priviledged permission.
- Once the Jenkins-dokcer recive  the command from the My-jenkins container its get in encrypted format in the TLS tcp://docker:2376 
- Post generating the image by pulling the base image, creating the layer & generate the final image it will get store in the jenin docker storage.
- To store the image we need to mention the storage driver here we call it as OVERLAY version 2
- After this it will ready for run the docker command
- Here why we need to give the Jenkins-dokcer Priviledged status true . Its a root level acces beacuse the docker daemon need root level access
- Dockerd need the kernel leverl acces to maintian the docker image, container
- After giving the root level acces & it will create rest of the docker image/container leavel acces the then we give the access to the Jenkin user 

With this solution what all we have achieved
1) Isolation (the my-jenkins docker cant access the host OS docker desktop)
2) Reproducibility (Docker environment created on all container anyonce can use)
3) Entire setup defined in two conainer Jenkins-dokcer & docker-file
4) Multi tenence (Cna run multiple jenkins instaneces)
5) Security (Sicne its under a spearacte container the HOST OS is scured any atack will be on teh container)

---------------------------------------------------------------------------------------------------------------------------------------------

MAIN CONCEPT RUN BEHIND THE DIND

1) Client-server architecture it will work (its also called as split brain)
    Docker is consist of 2 things client(cli) & the server(dockerd)
    Docker daemon is long running BG procces
    Its listen the API request, on request basis it has to communicate with the linux kernel, that linux kernel is provide by WSL2
    Why the client-server arch is important in DIND , becuase the both container has to communicate & are in different contianer
    They both need network the docker compose give the network to both to get communicate

2) Unix socket vs tcp
    Docker daemon listens on a Unix domain socket /var/run/docker.sock
    socket is mounted into the container
    container talks directly to the host Docker daemon
    -v /var/run/docker.sock:/var/run/docker.sock
    here Docker daemon runs inside a container 
    Exposes Docker API over TCP (usually 2375 or 2376)

3) Priviledged mode & Linux capabilites
    container is a closed cabin , in that what container runs its the cotainer has its own namespace, C group all are hidden
    Nither Host oS or the container can see the FS, but the HOST OS only provide the space from own spave
    Standard container can´t accss the physical device raw device etc, it cant create any namespcea 
    But the Privileged container after that it will able to access the HOST devices so the jenkins-docker container is priviledged
    after that once the root level work completed its handover to the Jenkins

4) Union FS
    Docker iamgs createin a layer , Inside a contaier if the Image is created so the layers need ths storage to store
    To create a storage in the container we need a driver to store those , so thats why we need the Overlay2