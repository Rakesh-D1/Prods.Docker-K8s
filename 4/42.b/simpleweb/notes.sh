

// Docker desktop it copied the pakcage.json and index.js file from lock windows developing folder to the docker destop linux VM
// But it did not copeid these files from Docker desktop VM to container while creating the container

// To add this we need to add these steps in the Dockerfile we can see thatin the 42 file

// Now run the docker build command with copying the package .json
FROM node:14-alpine
COPY ./pakage.json ./
RUN npm install
CMD [ "npm", "start" ]