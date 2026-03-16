What is /proc dir in the Linux in citext of docker

-- Proc is not a try file system in Liinux OS
-- Its a virtual FS created by kernel
-- its not stored in hard disk
-- while a process run its just load in RAM
-- /proc is kernel talk to user base
kernel
  → holds
      - process state
      - memory usage
      - CPU usage
      - kernel parameters
-- user can read the running programe
-- to read the file need to visit /proc

-----------------------------------------------------------------

Every running precess will create a directory   insdie the dir it has cmdline,status , environ folders where the environ has the 
environemnet variables

Why /proc is important for the docker conainers ? when we create a container its a isolate process.


