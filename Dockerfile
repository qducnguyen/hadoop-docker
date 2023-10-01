FROM ubuntu:latest

MAINTAINER qducnguyen
#environment variables for changing JDK, HADOOP versions and directories
ENV JDK_TAR_NAME=jdk-8u202-linux-x64.tar.gz
ENV HADOOP_TAR_NAME=hadoop-3.3.6.tar.gz


#NOTE -- in case you want to install different JDK or HADOP version, 
#download and put the file in ./assets folder and rename it to jdk.tar.gz and hadoop.tar.gz
# OR change JDK_TAR_NAME and HADOOP_TAR_NAME above
#YOU ALSO NEED TO CHANGE NAME IN 'JAVA_HOME' ENVIRONMENT VARIABLE BELOW SAME GOES FOR HADOOP

#install basic utils and python
RUN apt update
RUN apt install -y python3 arp-scan openssh-server

# ssh without key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys


#***setup JDK***#
WORKDIR /opt
ADD ./assets/${JDK_TAR_NAME} .
#ADD automatically untars

#add path variables for JDK
ENV JAVA_HOME=/opt/jdk1.8.0_202

ENV PATH=$PATH:$JAVA_HOME:$JAVA_HOME/bin
#TESTIGN
# RUN java -version

# Make datafolder
RUN mkdir -p /opt/hdfs_data/datanode
RUN mkdir -p /opt/hdfs_data/namenode

#***setup hadoop***#
ADD ./assets/${HADOOP_TAR_NAME} .

#adding path variables and environment variables for HADOOP
ENV HADOOP_HOME=/opt/hadoop-3.3.6
ENV HADOOP_STREAMING_JAR=$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar
ENV PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
#$hdfs or $hadoop instead of /opt/hadoop-3.3.6/bin/hdfs or /opt/hadoop-3.3.6/bin/hadoop

#***CONFIGURATION***#
#adding hadoop configuration files
ADD ./config-files/hadoop-env.sh $HADOOP_HOME/etc/hadoop/
ADD ./config-files/core-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files/mapred-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files/hdfs-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files/yarn-site.xml $HADOOP_HOME/etc/hadoop/
ADD ./config-files/workers $HADOOP_HOME/etc/hadoop/

#!!! IMPORTANT
# datanodes connect to namenode and for that they should know namenode's hostname and port. \
# this is specified in core-site.xml
# by default i am using hostname 'namenode-master' and port '9000'. if you change this in core-site.xml then all
# datanodes would be trying to connect to your changed hostname and port. 
# So be sure to change your namenode's to hostname to whatever you specified in core-site.xml
# by default docker assigns random hostnames to containers. hdfs/namenode/scripts/run.sh shows how to run a container with custom hostname.

#TESTING
# RUN $HADOOP_HOME/bin/hadoop

#this image is supposed to work as base for other images. still if you want to move explore around you can start the cntainer in integrated terminal.
#$docker run -it hadoop_base

CMD [ "sh", "-c", "service ssh start; /bin/bash"]