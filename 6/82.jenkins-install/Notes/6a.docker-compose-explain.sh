Environment variable
 /etc/profile default environtment vailables for all users created there
/etc/profile.d/<custom.sh>
~/bashrc_profile

An env variable is a key value pair that keyvalue pair injected in running process in start up

Whne process start the nv var iss read only file so process  will read fromm there. Whe process closed all BG opreatinon using  the env varriale
stop using  the path

Any env variables are wittin in this format 
DB_HOST = 10.0.0.5
DB_PASSWORD = admin123
we can ccall this whne the process starts
Hardcoding this variables is not a good process

LINUX PROCESS
- Every linux process has a directory created in the proc directory for e.g
Linux process
/proc/<pid>/environ

- For a running procss we have a process directory inside the path root/proc dir
- inside the pid we have a  environ file
- Any programe read the environ variable via system call for e.g app call OS that called the Kernel call process

Now consider the same flow in the prespective to the Docker 
- we assign that environment varibales for the container in the compose file
-what ever we writ the environemnt varaibles in Key-value pairs its passed to the container while we run it start running

In the DIND containerr we mentioned env variabels in the compose file  refer the code

  jenkins-docker:
    image: docker:dind
    container_name: jenkins-docker
    privileged: true
    environment:
      - DOCKER_TLS_CERTDIR=/certs  // This is the run time env variables

Now this env variables will inject in the main process of cotainer once we start run it

-- Dockere daemon will read the env varibale from docker compose file . 
-- In DIND conaiter the dockerD will first enable the TLS in this step in has mentioned
     environment:
      - DOCKER_TLS_CERTDIR=/certs  // This is the run time env variables
      
--And will generate the certificate & store in /cert folder 
--It will crate a CA (certificate authority) in  /cert a client /cert/client certand a  server cert 
--This TLS communication will secure the connection between the Jenkins & the docker by athunticating the certificates

