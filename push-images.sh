#!/bin/bash

namespace="$1"

<<<<<<< HEAD
for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker; do
=======
for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker zookeeper kafka kafka-manager; do
>>>>>>> Add kafka stack
    echo Pushing to docker.io $i
    ( cd $i && docker build -t $namespace/$i . )
    docker push $namespace/$i
done
