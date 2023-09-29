FROM hadoop_base:latest
# !! IMPORTANT
# make sure hadoop_base:1 is the name of the image you built.

# Create directories for namenode storage
# specify multiple files if you want to create multiple storage files for redundancy
RUN mkdir /opt/hdfs
RUN mkdir /opt/hdfs/namenode
RUN mkdir /root/data

# ***ADD CONFIG FILES***
ADD ./config-files/hdfs-site.xml $HADOOP_HOME/etc/hadoop/

# necessary before running namenode
RUN hdfs namenode -format
CMD hdfs namenode