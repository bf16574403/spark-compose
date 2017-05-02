#!/bin/bash

namespace="$1"

for i in hadoop hadoop-namenode hadoop-datanode hadoop-resourcemanager hadoop-nodemanager hadoop-historyserver spark spark-master spark-worker java zookeeper kafka kafka-manager elasticsearch logstash kibana filebeat; do
    echo Pushing to docker.io $i
    ( cd $i && docker build -t $namespace/$i . )
    docker push $namespace/$i
done
