#!/usr/bin/bash

docker run --rm \
    -v  dev_jenkins-data:/data \
    -v ~/Prods.Docker-K8s/6/82.jenkins-install:/backup \
    alpine sh -c "cd /data && tar xzf /backup/jenkins-backup-20260515_123226.tar.gz"