#!/usr/bin/bash

docker run --rm \
    -v 82ajenkins-install_jenkins-data:/data \
    -v $(pwd):/backup \
    alpine tar czf /backup/jenkins-backup-$(date +%Y%m%d_%H%M%S).tar.gz -C /data .