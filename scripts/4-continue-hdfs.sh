#!/bin/bash

#Automatical stats one namenode and 2 datanodes in a docker network

#namenode
docker start namenode 

#datanode 1
docker start datanode1 

#datanode 2
docker start datanode2 

#namenode for operating hadoop cluster(attached to current terminal)
docker exec -it namenode bash
# start-all.sh

