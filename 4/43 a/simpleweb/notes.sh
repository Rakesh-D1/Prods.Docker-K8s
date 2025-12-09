Here we change the port number in the index.js file and chkd the conatiner running with the give port
 
Chnages in the index.js 
app.listen(6000, () => {
  console.log('Listening on port 6000');
});

now run the command -  $ DOCKER_BUILDKIT=0 docker build -t b88devops/simpleweb .

Once the images is created now run the container

$ docker run -p 5000:6000 b88devops/simpleweb