While everytime building the app user is changing the index file and rest of the changes are static like Alpine image, package.json etc
So its better to copy the index file in evey image build rather than rest of the steps e.g 

// Static = FROM node:14-alpine
Here only the index file is changed not the package.json =WORKDIR /usr/app    
// Static =COPY ./ ./
// Static =RUN npm install
CMD [ "npm", "start" ]

To overcome this we added the index file post the npm is install so in every build till the npm is it will take from cache 
And the rest it will be like the earlier

FROM node:14-alpine
WORKDIR /usr/app    
COPY ./package.json ./
RUN npm install
COPY ./index.js ./
CMD [ "npm", "start" ]

In this 45 a we dont have the added the changes  same changes we need to add in the 45b file
