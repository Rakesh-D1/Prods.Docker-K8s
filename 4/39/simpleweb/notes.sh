// Here the issue came ddue to the base level image is taken as Alpine
// Where the mode.js image is not supported on the alpine tthahy we get on the second step 

Step 2/3 : RUN npm install
 ---> Running in ec3da303246f
// /bin/sh: npm: not found
//The command '/bin/sh -c npm install' returned a non-zero code: 127

// Now we have to install in the alpine imapge wehre is the node is already isntalled checkl the base imnapge in the 40th folder