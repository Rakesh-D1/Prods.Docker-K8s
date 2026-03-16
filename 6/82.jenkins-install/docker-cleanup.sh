#!/usr/bin/bash

docker system df -v     #IThis command will show the volume space usage, Image space usage etc
docker images -f dangling=true   # This willl shows the dangling images
docker builder ls   # it will shows which builder
docker buildx du  # it will give the disk usage
docker builder prune --force --verbose  # docker cleanup
docker volume prune -f # it will clear the dangling volumes