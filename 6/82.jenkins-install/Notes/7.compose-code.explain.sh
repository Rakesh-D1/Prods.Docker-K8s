Explanantion of this code
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

This fil define the distributed system which define the Brain & Muscle . Branin is jenkins its the CI server & Muschle is DockerD in DIND contianer
The entire building is created by jinkins.
services block will define contaioner behavior i& coantiner
The Jenkins-dcker here in this code is Muscle
DIND is Images & Container inside a running container

- Code     privileged: true in the image: docker:dind conatainer is a security critcal flag, it provides the root level access
   without this a standanrd coantiner cant have the host level kernel access wont get, without that dockerd can´t get the 
   namespace , Controld for allocation of spcae to the contaiener

- Code    volumes:
      - jenkins-docker-certs:/certs/client
    - Named Volume we mapping this to persit our data to run Jenkins to retain data. For e.g we download the plugins in the jenkins
      on every start the jenkins container the data will be persist & the plugins user datails will be there
    - Bind mount we did in the development env, for the local

For the my-jenkins volume 
    volumes:
      - jenkins-data:/var/jenkins_home
      - jenkins-docker-certs:/certs/client:ro

    whne jenkins acess this volume its completely read only.

For the ports    
        ports:
      - "2376:2376"

      This ports are reserved for the DIND conaitner & allow to run the docker command in laptop host against your contianer even you can debug that

For the Network is define we created the netowrk Jenkins & we gave it alias name as dokcer
      jenkins:
        aliases:
          - docker

- Docker copose is giving the internal dns, is accesible to docker contianer , if you use docker alais you can reach to the contianer.
- This alias ensure when the my-jenkins contianer try to connect with the jenkins-docker container over the TLS network
-  the der iname of the network using the TTLS network & commnicvia the poorr2376

 For the storage     command: --storage-driver overlay2
    Here the dockerd defines don´t user the docker desktop storage instad of that use the Overlay2 staorage of COntainer, it is fiaster & stable

    