In the last code the route was not defined for the redis server
const client = redis.createClient();

In docker compose we have run two service node (node-app) & Redis(redis-server) so it wil create 2 containers
redis server running on the 6379 port here we have gave the dns name as redis-server 
Both these servers node-app & redis-server are working on the network shared Docker network whihc docker creating this one
And this network  is created by the only via dockerCOmpose using the same shared folder
When we start docker compose up its starts the redis app on 6379 & node server in same shared docker network both the container will run
Both the containers are communicating via the dns name
whenever we visit the node server the number of visits are stored in the redis server
redis will accesbile to Node via hostname resdis-server
redis-client is defined in index.js it must point to redis.server dns   

as per the network traffic redirection we are doing to the 4001 & node app is running on the port 8081
 ports:
      - '4001:8081'


Now in the redis client we need to mention the redis server to connect with the host
const client = redis.createClient({
  host: 'redis-server', 
  port: 6379
});