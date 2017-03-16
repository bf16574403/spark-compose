#!/bin/bash

<<<<<<< HEAD
for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker; do
    echo Building $i
    ( cd $i && docker build -t test/$i .)
=======
for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker java zookeeper kafka kafka-manager; do
    echo Building $i
    ( cd $i && docker build -t bf16574403/$i .)
>>>>>>> Add kafka stack
done
