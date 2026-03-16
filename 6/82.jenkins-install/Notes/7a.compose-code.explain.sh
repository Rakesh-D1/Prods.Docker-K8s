  my-jenkins:
    image: my-jenkins
    build:
      context: .
    container_name: my-jenkins
    restart: on-failure
    environment:
      - DOCKER_HOST=tcp://docker:2376
      - DOCKER_CERT_PATH=/certs/client
      - DOCKER_TLS_VERIFY=1
    volumes:
      - jenkins-data:/var/jenkins_home
      - jenkins-docker-certs:/certs/client:ro
    ports:
      - "8080:8080"
      - "50000:50000"
    networks:
      - jenkins

  
- Jenkins use the 8080 port, to coonect o jenkins to open the Jekins UI
- Port 50000
      ports:
      - "8080:8080"
      - "50000:50000"
    port 50000 dont have any role in Jenkins browser open.
    * Port 50000 is a TCP port, jenkins works with the controller agent mode
    * Jenkins as controler like multiple machiens are running like agent 1 , 2,3,4 all are controlled by the Jenkins controoler
    * build the pipeline in separate machine isntlal maven in agent 1 , 2,3,4 in different machine 
    * Here in the agent we will use docker as agent  we willl utilize the DIND container
    * The port 50000 we are exposing that in the my-jenkins container.
    * To connect  over a network the jenkins comntroler with the agent . then it need host name & userid    password authentication 
    * Port 50000 is a TCP port, jenkins works with the controller- agent model.
    * The Jenkins install here in a separate machine & the other server like maven, tomcat etc.
    * here we are using the Dockerization to create the servers, machine etc .
    * Here in agent we will use docker as agent, the dind contianer
    - The controller  need to connect with the agents, its needed the neworking protocol
    * It require the hostname, password to connect with the agent via port