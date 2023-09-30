#!/bin/bash

docker network create dock_net

docker run -itd --net dock_net --hostname namenode-master --name namenode --mount type=bind,src="$(pwd)/data",target="/root/data" -p 9870:9870  -p 50070:50070 -p 8020:8020 -p 9000:9000 hadoop_base:latest
docker run -itd --net dock_net --hostname datanode1 --name datanode1 hadoop_base:latest
docker run -itd --net dock_net --hostname datanode2 --name datanode2 hadoop_base:latest

docker exec -it namenode bash
