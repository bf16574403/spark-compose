#!/bin/bash

namespace="$1"

for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker zookeeper kafka kafka-manager; do
    echo Pushing to docker.io $i
    ( cd $i && docker build -t $namespace/$i . )
    docker push $namespace/$i
done
