#!/bin/bash

sudo service ssh start

if [ ! -d "/tmp/hadoop-hduser/dfs/name" ]; then
  $HADOOP_HOME/bin/hdfs namenode -format
fi

$HADOOP_HOME/sbin/start-dfs.sh

hdfs dfs -mkdir /user
hdfs dfs -mkdir /user/hduser
hdfs --daemon start httpfs

bash
