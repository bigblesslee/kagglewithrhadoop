
Sys.setenv(HADOOP_CMD="/usr/local/hadoop-2.7.4/bin/hadoop")
Sys.setenv(HADOOP_STREAMING="/usr/local/hadoop-2.7.4/share/hadoop/tools/lib/hadoop-streaming-2.7.4.jar")

library(rhdfs)
library(rmr2)
hdfs.init()
