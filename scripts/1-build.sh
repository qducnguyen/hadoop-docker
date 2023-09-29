#!/bin/bash
FOLDERPATH=$(pwd)

docker build . -t hadoop_base:latest
cd ${FOLDERPATH}/hdfs/namenode/
bash scripts/build.sh
cd ${FOLDERPATH}/hdfs/datanode/
bash scripts/build.sh