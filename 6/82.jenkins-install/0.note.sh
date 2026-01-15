Docker compose here will create two containers jenkins-docker & my-jenkins
In this container the docker cli will get installed my-jenkins
docker-daemon will run on the my-jenkins

To make speak with each other my-jenkins & my-jenkins or data transfer we need ti install certificates.When we open 
docker-daemon to the network, docker compose will open the docker-daemon to the network... docker comp[ose is creating the newtork
The network which is require to connect that is TCP protocol...here the TLS will add the secuirty while transferring
the data.

TLS protocl is on TCP network ... To secure the network between the My-jenkins & the jenkins-docker we need to secure connection which TL  provide this one.

Step1-  Here the jenkins-docker generates a certificate Lock (server -certificate) & Key certificate (client-certificate)
        These certificates are stored in volumes, whihc maintained by docker (inside the container)

Step2- Now the my-jenkins will mount the key, my-jenkins needs the client certificate , which has match the hash value with the
        jenkins-docker. If the lock & key are corresponding with each other then they will excute the command.

here we only installing the docker-ce-cli docker cli not the dokcer server. 
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

Workflow of the Dockerfile & docker-compose.yml

1. Boot (First jenkins-docker container will get starts, we have priviledged it so docker daemon will get initialized
        in boot phase it will generated the Keys )
2. Connect (In connect my-jenkins will get start & it will read the environment varaible of docker-host whihc have 
            path of )
3. Action  (In action the jenkins pipeline will run whihc will wrot ein groovy jenkins file)
4. process (In my-jenkins we are writting the docker commnads it will read the config file then it will encrypt where it
            use the encryption certificate... now the commands send from jenkins-docker it will encrypted to TCP packeets
            the TCP packets will send to TCP packets to docker port 237)
5. Execution (Here the jenkins docker recive the packets and now it will validate the clinet key with server key.. now it 
            decrypt, it need the image apline for now so it will get download the alpine jenkins-docker)


- Here we are using jenkins are build server, jenskins will give the build, jenkins itself will runb in docker. Now how to handle  these issue ,
or how to handle these complexity
- What s DIND is docker in docker , post DIND will work on Pipeline as COde

USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

While installing the Jenkins the user should be changed to root , because it need the root level acces to install
USER root

Here we are updating & installing the jenkins server & along with the Jenkins server we are installing the docker cli

RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

Post installing the Jenkins we are installing the docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli

Now after that we are hand over the Jenkins user from the Root post installation
USER jenkins