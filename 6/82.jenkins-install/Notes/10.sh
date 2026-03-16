JAN 24

How to update the Jenkins in the the contaier:
 1: First  docker-compose down close the running contianers
 2: Now verify the Jenkins LTS in the jenkins website & its version
 3: Now  docker-compose build it will take the latest LTS version & update the jenkins in the My-jenkins container
 4: Now do docker-contaier up , the latest version of the jenkins will show

 Command to remeber fo rthe clean up

docker system df -v     #IThis command will show the volume space usage, Image space usage etc
docker images -f dangling=true   # This willl shows the dangling images
docker builder ls   # it will shows which builder
docker buildx du  # it will give the disk usage
docker builder prune --force --verbose  # docker cleanup
docker volume prune -f # it will clear the dangling volumes

Pipeline stage view plugin
