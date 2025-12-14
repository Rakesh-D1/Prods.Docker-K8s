Here we have to run a container with the created image
after running it will give the error error in connection with the redis server
Error: connect ECONNREFUSED 127.0.0.1:6379
Emitted 'error' event on RedisClient instance at:
    at RedisClient.on_error

Here the Node js server unable to connect with the redis server

And the container also shows in the exited state    
$ docker ps -a
CONTAINER ID   IMAGE              COMMAND                  CREATED              STATUS                          PORTS     NAMES
c9fb10fc1896   b88devops/visits   "docker-entrypoint.s…"   About a minute ago   Exited (1) About a minute ago             keen_swartz

After this now create a redis container post that run the docker node image

Keep the redis server run
docker run redis    -------------- This command will downlaod the image & the run the redis server in a container which the node server
can use & connect with the redis server

Now after that again if we try to run the Node server & try to connect the server with redis DB it will again give the error
docker run b88devops/visits
becuase still now we haven't did the networking it will again refuse to connection
**********************************************************************************************

To overcome this issue we need to write the dockercompose file
In the same build context we have create a new dockercompose file wehre all the build related file & the Dockerfile will be there
