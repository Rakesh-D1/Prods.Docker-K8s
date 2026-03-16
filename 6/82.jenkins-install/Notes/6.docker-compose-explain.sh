SERVICES
-   we have 4 services Service-1 Web connected to Service1 DB & Service-2 web whihc is coonected to the Service-2 DB
-  When we define the serviecs in the docker container file , it defines which container should docker run & how the behaviour will be
-  1 docker service is one container defn 
-  services,  Volume & Network are the siblings objects in docker compose file
-     jenkins-docker:
    image: docker:dind
    container_name: jenkins-docker

  1)  Here the docker creating a container named jenkins-docker to run dind
  2)  The only purpose of this container is it will act as a docker server for the jenkins

  If we mentioned the replicas in the serrvies for a container it will create that many containers
      jenkins-docker:
    image: docker:dind
    container_name: jenkins-docker
    replicas: 5

    While creating a container it will create other configurations such as PORTS, VOLUMES & NETWORK

    DOcker is created over 3 layers
    1. Image (Its a blueprint)
    2. Container (runnin process, its not sharabale since its a arunning process)
    3. Services (Here we have defn of contianer behaviour, how a container should run ) for eg we have 4 services one for the DIND, DB , APp under testing
        docker compose will wire all these services, 
        services is a execution contract a pre define steps to execute, rest all are to support service like Network Volue inb end of the compose file

        jenkins-docker DIND need a kernel to run , becuase without linux kernel the docker wont be able to run
        So the container which we have created will take the kernel of the WSL2 
        COntianer do not have there own kernel to run the docker commands, its stands on the VM wehre it share the kernel

         privileged: true
         we do this ste  privileged tru to ensure the DIND docker damon need the C group , namespace , Overlay2, iptables its did not get access
         it do not run & create the image or build, here hte docker user the root so its a security laps.
         Now since the container dont have the kernel it will use the OS kernel with the root priviledge which is a big security threat
         Noe dockerd will hit the Host OS kernel
         here the pholiosphy of containerr isolation breaks sicen its goes to the host OS

         Container dont have any kernel they use the host
         same in bare mmetal or Amaxon linux it will use the host OS kernel
         
