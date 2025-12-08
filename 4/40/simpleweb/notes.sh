Here we have used the node:14-alpine so the earlier used image not compactibel with the ode it will be reolved
// here the issue comes with the package . json file , its happened because the same thing was not mentioned in the Dockerfile...Verify 
// To run the command npm installed, package . json file need to run , but here the package.json and the index.json was not mentioned in
// the Dockerfile .... Only these three lines are mentioned

// Dockerfile FROM node:14-alpine
// RUN npm install
// CMD [ "npm", "start" ]

// Due to package.json is not get transferred got this issue .. package-lock.json. You should commit this file. verify the log

Step 2/3 : RUN npm install
 ---> Running in 1d6247417d54
npm WARN saveError ENOENT: no such file or directory, open '/package.json'
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN enoent ENOENT: no such file or directory, open '/package.json'
npm WARN !invalid#2 No description
npm WARN !invalid#2 No repository field.
npm WARN !invalid#2 No README data
npm WARN !invalid#2 No license field.

// Login behind this is when we add the Dockerfile and dont add the pakcage.json and index.js file, From the context line the

// Docker desktop it copied the pakcage.json and index.js file from lock windows developing folder to the docker destop linux VM
// But it did not copeid these files from Docker desktop VM to container while creating the container

// To add this we need to add these steps in the Dockerfile we can see thatin the 42 file