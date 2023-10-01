#!/bin/bash
docker exec namenode sh -c "stop-all.sh"
docker stop namenode
docker stop datanode1
docker stop datanode2