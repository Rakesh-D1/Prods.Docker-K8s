                                             DIND 4

Explanation of the Docker compose YAML file

ervices:
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

networks:
  jenkins:
    driver: bridge
 
volumes:
  jenkins-docker-certs:
  jenkins-data:          

  
  Wher the images are getting created In Host or the in the DIND jenkins-docker container ?

- In Jenkins we write the Groovy scripts called as PAC, the PAC is limited to the jenkins jobs
Rest we write in the 
- In Jenkinsfile we write all the PAC code there inside that we will give all isntruction how the container create etc in the Jenkinsfile
- Host OS docker desktop we use to create the container My-jenkins & the jenkins-Docker
- Then the My-jenkins container use to send the docker command
- jenkins-Docker will work as a server dockerd wwehr next we create the containers & work as the server
- All jenkins plugins, builds , user info , workspace info in My-jenkins, sicne conatiners are ephimeral in nature to regain all these data 
  we need to save all these in the volume
- While the My-jenkins is startup again with docker-compose up the new coantienr will gett all the data in the volume & it will get spin up

In My-jenmins container we write the PAC the jenkins , all these are written in Jenkins job in the jenkinsfile as the PACthat is called the build context
My-jenkins will send the buildcontext it will go via CLI, in jekins all the descirptions are there
Now the build context will travel through a network , this network is TCP network.
Once the docker CLI send the request the DIND (Jenkins-docker) will recived the request & then it performs the build
It will go via job configuration

the scipts we can writ in the Jenkins UI that we can write there in the Jenkinsfile, so writting this file will be a sharable file
whihc can be shared across the team via github

All this Jenkins related code & file we are doing in the My-jenkins container whihhc as the CLI

---------------------STORAGE LOCATION--------------------------
The resulting images we are creating the layers of the image is created & the manifest those all are stored somewhere ?
These all are stored in the jenkins-docker containers filesystem 
THe path for the /var/lib/docker speciafically this is the path in the conatiner all the layers going in this
DIND store the image it is creating inside hte /var/lib/docker folder

The images created by the Jenkins pipleins will not visble on the docker desktop, since these all are runningin the docker-jenkins container


---------------------- VOLUMES IN JENKINS-DOCKER FILE--------------------------------
    volumes:
      - jenkins-docker-certs:/certs/client
      - jenkins-data:/var/jenkins_home
    We have two volume in the jenkins-dokcer one is for the Certificate & jenkins data in DIND image
    All the images which are created will go in this location /var/lib/docker 
    If the docker conatainerr DIND get restart all the savings will go , so thatś why use the data persisit as named Volume

    SERVER:  What is a server, its a programe its running in BG & wait for any process once its recieve any process it take action on that. The DOcker is also same 
    It made on Client server architechture
    Docker daemon (DockerD) is a server its serving the container management service to Docker CLI

    1) What is a build context ?
      Build context is set of files your docker-file sends to the docker daemon.
      e.d we write a command ¨docker build . "the dot we give after the build is the build context 
      BUILD CONTEXT has 3 aspects 
      a) Remote problem
      b) Solution 
      c) Why did happen
      This happen in client server arch
                                                                                              