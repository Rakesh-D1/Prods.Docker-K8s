JAN 22

FROM jenkins/jenkins:lts-jdk21
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

* For the Jenkins file to check the inside the running container & go to the path command for that # docker exec -it my-jenkins /var/jenkinshome
* Once we install the jenkins plugins & run this command # docker exec -it my-jenkins ls -la & verify plugins installed 
* Now once the plugins are isntalled we can add the doamin & lanuch the jenkins UI http://localhost :8080
* we can check this path for the Jekins version cat /var/jenkins_home/war/META-INF/MANIFEST.MF | grep Jenkins-Version
* to check the created user in docker exec -it my-jenkins /var/jenkinshome/users

USER ID
admin-rakesh
admin
* 