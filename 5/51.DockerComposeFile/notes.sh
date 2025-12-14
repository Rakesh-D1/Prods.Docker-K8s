In docker-compose yml file we have mentioned this code
version: '3'
services:
  redis-server:
    image: 'redis'.
  node-app:
    build: .
    ports:
      - '4001:8081'
This will create the conatiner for the redis & the node server along with that it will do that network routing for the node port with 
redis port

Here the Dockerfile is creating the application

Docker copose file explanation
  redis-server:
    image: 'redis'.
In this line here with redis image here it will run the redis constiner
redis work in 6379 port
It will work only on the context wehre all the context file & the docker files are in the same context path
docker compise internall run the network
Docker compose will automatically provide the dns name

Now hos port we are mapping with the node port
    ports:
      - '4001:8081'
In this line of code

