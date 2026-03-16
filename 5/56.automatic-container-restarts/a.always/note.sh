Here we are intentionally restarting the container by adding the init as 0
Following line of code is added in the index.js file 
app.get('/', (req, res) => {
  process.exit(0);  // Here we add the process as 0 intentionally to restart the container

Process.exit

It will show the olog like this whuile accessing the container it will always restart it
http://localhost:4001/ on browser

node-app-1 exited with code 0 (restarting)
node-app-1      | 
node-app-1      | > start
node-app-1      | > node index.js Config   w Enable Watch
node-app-1      |
node-app-1      | listening on port 8081
node-app-1 exited with code 0 (restarting)
node-app-1      | 
node-app-1      | > start
node-app-1      | > node index.js Config   w Enable Watch
node-app-1      |
node-app-1      | listening on port 8081
node-app-1 exited with code 0 (restarting)