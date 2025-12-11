// WORKDIR... directly copying the workspace in the container root directory , we need to create a spearate directory insiode the 
// COntianer , so it wont clash or override with other container directorires . FOr e.g the contaier root have the bin, var , dev 
// file if the same we push in the container the name could clash with other application directories.

Now if we have created a container without giveing the WORKDIR
// Create a docker image 
$ DOCKER_BUILDKIT=0 docker build -t b88devops/simpleweb 

// Now create a container and enter into the shell of the container
$ docker run -i -t b88devops/simpleweb:latest sh
result when you run the command ls -la  
/ # ls -la
total 100
drwxr-xr-x    1 root     root          4096 Dec 11 07:02 .
drwxr-xr-x    1 root     root          4096 Dec 11 07:02 ..
-rwxr-xr-x    1 root     root             0 Dec 11 07:02 .dockerenv
drwxr-xr-x    1 root     root          4096 Mar 29  2023 bin
drwxr-xr-x    5 root     root           360 Dec 11 07:02 dev
drwxr-xr-x    1 root     root          4096 Dec 11 07:02 etc
drwxr-xr-x    1 root     root          4096 Mar 29  2023 home
-rwxr-xr-x    1 root     root           201 Dec  9 14:55 index.js
drwxr-xr-x    1 root     root          4096 Mar 29  2023 lib
drwxr-xr-x    5 root     root          4096 Mar 29  2023 media
drwxr-xr-x    2 root     root          4096 Mar 29  2023 mnt
drwxr-xr-x   70 root     root          4096 Dec 11 06:57 node_modules
drwxr-xr-x    1 root     root          4096 Mar 29  2023 opt
-rw-r--r--    1 root     root         22785 Dec 11 06:57 package-lock.json
-rwxr-xr-x    1 root     root           109 Dec 11 06:57 package.json
dr-xr-xr-x  273 root     root             0 Dec 11 07:02 proc
drwx------    1 root     root          4096 Dec 11 07:03 root
drwxr-xr-x    2 root     root          4096 Mar 29  2023 run
drwxr-xr-x    2 root     root          4096 Mar 29  2023 sbin
drwxr-xr-x    2 root     root          4096 Mar 29  2023 srv
dr-xr-xr-x   13 root     root             0 Dec 11 07:02 sys
drwxrwxrwt    1 root     root          4096 Mar 29  2023 tmp
drwxr-xr-x    1 root     root          4096 Mar 29  2023 usr
drwxr-xr-x   12 root     root          4096 Mar 29  2023 var
/ #

Insdie the container these files are with the root 
-rw-r--r--    1 root     root         22785 Dec 11 06:57 package-lock.json
-rwxr-xr-x    1 root     root           109 Dec 11 06:57 package.json

which can later create a conflict

Now create a work directory inside the container to overcome this issue add the "WORKDIR /usr/app " while image creation
FROM node:14-alpine
WORKDIR /usr/app    
COPY ./ ./
RUN npm install
CMD [ "npm", "start" ]

Now post creation of the container the /app directory will created and all the node related files will be inside the app folder

$ DOCKER_BUILDKIT=0 docker run -i -t b88devops/simpleweb:latest sh
/usr/app # ls
index.js           node_modules       package-lock.json  package.json
/usr/app #
+++