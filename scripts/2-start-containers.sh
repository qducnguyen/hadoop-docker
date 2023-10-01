#!/bin/bash

docker network create dock_net

docker run -itd --net dock_net --hostname namenode-master --name namenode --mount type=bind,src="$(pwd)/data",target="/root/data" -p 9870:9870 -p 8088:8088 hadoop_base:latest
docker run -itd --net dock_net --hostname datanode1 --name datanode1 hadoop_base:latest
docker run -itd --net dock_net --hostname datanode2 --name datanode2 hadoop_base:latest

docker exec namenode sh -c "hdfs namenode -format"
docker exec -it namenode bash
# start-all.sh

