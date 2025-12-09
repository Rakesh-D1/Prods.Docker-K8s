// Give a tag name while creating the images 
// Commd is doce
// DOCKER_BUILDKIT=0 image build -t imagename . // here we are giving the tag name 
// Post successfully creatiobn of the Docker image Sending build context to Docker daemon   5.12kB
Step 1/4 : FROM node:14-alpine
 ---> 434215b487a3
Step 2/4 : COPY ./ ./
 ---> Using cache
 ---> 4cddc9f08153
Step 3/4 : RUN npm install
 ---> Using cache
 ---> 07761f56fe26
Step 4/4 : CMD [ "npm", "start" ]
 ---> Using cache
 ---> 1d7370ba408d
Successfully built 1d7370ba408d
Successfully tagged b88devops/simpleweb:latest

// Now create a new container using the same node image
// docker run b88devops/simpleweb:latest

// Post creation of the container the localhost:8080 wont work now since the port configuration is not done
// The applicaiton is running on container 8080 we need to connect the contatiner now we have to forward this to the host FS 

docker run -p 8080(host forward port):8080 (container forward port) b88devops/simpleweb:latest

docker cli will send the command to docker daemon to run & transport the port from container FS to host FS  

now run the command -  docker run -p 8080:8080 b88devops/simpleweb:latest