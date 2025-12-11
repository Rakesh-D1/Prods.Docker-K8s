Here we change the port number in the index.js file and chkd the conatiner running with the give port
 
Chnages in the index.js 
app.listen(6000, () => {
  console.log('Listening on port 6000');
});

now run the command -  $ DOCKER_BUILDKIT=0 docker build -t b88devops/simpleweb .

Once the images is created now run the container

$ docker run -p 5000:6000 b88devops/simpleweb


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
