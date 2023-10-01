![](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.0PlozBoD9DCXtvwadQ28ZQHaEA%26pid%3DApi&f=1)

# Simple Hadoop Cluster 3 Nodes on Docker Group 05 - DSAI K65

This is a very simple setup for Hadoop cluster using docker. Explanation for every command or step is written as comment in all files. 

## Structure:
There are four major parts of this setup, 
- **assets** : This folder contains binaries for Hadoop and Java. Please download JDK 8.0 binaries and hadoop 3.3.6 binaries and rename them to hadoop-3.3.6.tar.gz and jdk-8u202-linux-x64.tar.gz and put them under folder 'assets' for it to work properly.
- **data**: This folder contains arbitrary large dataset to test.
- **config-files** : All configures for Hadoop ${HADOOP_HOME}/etc/hadoop/ are in here.
- **gnome-kmer-counting**: Mapper and Reducer for gnome kmer exerice using Hadoop Streaming.
- **scripts**: scripts for building, running and cleaning images, docker containers for this repo

*All assets and data are available in [this folder](https://husteduvn-my.sharepoint.com/:f:/g/personal/duc_nq204876_sis_hust_edu_vn/EmOBRWGhepBDpfrmdyeembkB7wLes_o4sd2QrdqAyYhqgQ?e=HWVkBh)*. Please download the right files for the ``assets`` folder.

## Running 
Please follow the order in `scripts` folder. 


