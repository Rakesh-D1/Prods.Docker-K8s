Now we have added the the index file separately 

FROM node:14-alpine
WORKDIR /usr/app    
COPY ./package.json ./
RUN npm install
COPY ./index.js ./
CMD [ "npm", "start" ]

Now in every docker run if the user have make change on the index file only then no need to rebuild the entore unchanged files