NETWORK
TCP://docker:2376

- TCP is a protocol is a transmission controller protocol
- we are not using the local file socket / unix socket /var/run/docker.socket, this will work only when the client & Host are on same OS
- we have 2 different container enkins-docker & my-jenkins so they both act as two different OS
- docker CLI & dockerd are in 2 differnt machine with different OS
- They both conteiner need to communicate , for sucre connection we use the TCP connection over the network
-  This we defined in the docker compose

In the docker compose file we have mentioned the networks
    networks:
      jenkins:
        aliases:
          - docker

In a container we have the siblings Volume , Ports, Networks 
- Jenkins-docker container has a network whihc we give the alias name as docker
- docker compose using ths network will setup one DNS record, when the jenkins container tris to reach docker , the internal DSN reslove
  & give a IP address & that address is called docker-compose assigning to DIND.
- Then it will look into the port where it can route the commuunication


VOLUME
COW - Copy On Write , means once u read a file, docker looks to the image layer, when we are editing the file, docker copies the file to top layer & edit 
      there in conatier & do the changes there.

      The image layers are stored in the writable layer of the jenkins-dokcer conatiner , whenever we down the data in docker copmose file the layer
      get vanish, so every time we have to set the data & while the docker compose to be start.
      TO overcome this issue we have the VOlume, to retain the data

      The CLI in the my-jenkins will send the isntruction to the DIND server via TCP 2376 port & reach to the DIND server , in result it 
      will geenrate the image throught the jenkins pipeline, the image will be reside in the jenkins-docker container

JENKINS

When ever the change happen in the code base , we have to rebuild the app , thapp upload tto a webserver for e.g NGINX. the total process
will run in a cyclic form
Jenkins helps in build software , test it & deploy to the werver
  
