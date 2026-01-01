bind mount of volume -v $(pwd):/app
Anonymous volume (bookmarking volumes) with no name added to the volume (-v /app/node_modules)
if we added the name to the volume we call it as a name volume (-v node_name:/app/node_modules)


when we do bind mount or named volumes 

In development environment we can use this -v $(pwd):/app so the changes we did in the preset work directoru with the js file $(pwd) will immidiatlly reflect in
the :/app

(-v /app/node_modules) here we gave without the name of the voulume but docker will take this as a use it with the work directory
 these both will give a two way communication with the Host & ocontainer 
 -v $(pwd):/app   &     (-v node_name:/app/node_modules)