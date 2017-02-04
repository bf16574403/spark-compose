#!/bin/bash

for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker; do
    echo Building $i
    ( cd $i && docker build -t test/$i .)
done
