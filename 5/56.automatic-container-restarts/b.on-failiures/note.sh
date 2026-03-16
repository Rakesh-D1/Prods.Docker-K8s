Now with the exisiting code if we run with 
app.get('/', (req, res) => {
  process.exit(0); 
It will give the issue of container restarting

so we have to chnage the process exit code from 0 to 1
app.get('/', (req, res) => {
  process.exit(1); 

  And again rebuild the docker compose
  
app.get('/', (req, res) => {
  process.exit(1);  // Here we add the process as 1 simulating a container crash
Now we have rebuild

 docker-compose up --build

