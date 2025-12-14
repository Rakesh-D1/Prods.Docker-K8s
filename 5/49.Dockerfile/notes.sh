// Here in this code block of the index.js & the package.json ... the package.json we have added the redis server
so the redis server will work as a in application memory , on every visit of the web application it will increase by one 
client.set('visits', 0);
To save the every visit we have added the same in the index.js

Now to make the boppth the server & in app redis db independent we need to create two new container & for each container we can add the
each server for the node & the redis we have to create in a separate container , no to get any interference ...

To overcome this we need to create the docker Compose