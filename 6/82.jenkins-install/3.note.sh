                                             DIND 3

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

Once we created the DIND container , here we are opening the DIND to a network. Docker compose creating that network since its in the Dockerd
will open to a network to communicate it need a protocol its use the TCP.
On OSI model its work on the TLS layer

TLS:
  The DIND is on the TCP network created by the docker compose, this exposed on the docker server.
  We dont want thhe unaccessed users on the network, so that we use TLS transport layer security
    Jenkins-docker contianer here has the DIND whihc work as the DockerD Its generate a lock (Server certificate) & a Key (Client cert) & this
    happens at the TLS layer
    These lock (Server certificate) & a Key (Client cert)  are stored in the volume which is handle by docker, it will create a named volume
    for this
  - Now the My-jenkins server werhe the CLI is there will mount this Lock-Key pair certificate volume. SO it will get the Key
  - My-Jenkins needs the clien certificate
  - We have to secure our dockerd so need to communicate with teh server we need a valid key pair or else it wont connect
  - My-jenkins will get the certificate, now once the user send the command with the My-jenkins key the Jenkins server will valideate it & 
    compare the key is validating or not.

                      --------------WORKFLOW-----------------------------

Now the entire workflow is going in summarize we can see
1) Boot
    In boot the Jenkins-container (DIND) get starts, its privileged due to that docker daemon isntance got init
    In Boot phase the TLS keys are also generated
2) connect
    here the My-jenkins container gets starts
    In the docker-compose we have mentioned the Env variables
3) Action
    here we are running the Jenkins pipeline whihc is written in groovy
    Will use the docker agent
    here will run the jenkins pipelin
4) procces
    The docker commands we are writting in the my-jenkins that will read the config file
    then it will encrypt using the TLS cert
    After encryption it will creat the TCP packets later these packets will send to the jenikins-docker docker:2376
    thse all will happen in the docker DIND
5) Execution
    jeenkins-docker it will recived the TCP packets post encrytpion after eciveing it achknoloedge
    If the cert matches it will decrypt the message, after succesfully decrupting it willprcoess the command
    after execution it will send the report back to my-jenkins with the TCP 

------DEFINATION----
1) Sidecar. Sidecar is a helper container, here its is DIND, it helps from the main container to perform the separate operations

2) Priviledged, Her ewe are giving the root level access, or else DIND contiaer wont run , it need to speak with the kernel, it need to access
    /var/run/docker.sock so only this kernel level root access can give with the C group, UF acces so priviledged access needed.

3) Remote Docker, It means youŕe controlling docker via TCP/TO netowrk 

4) Overlay2 Its a storage drive it is over the EXT2 , to resolve this we are using the volume