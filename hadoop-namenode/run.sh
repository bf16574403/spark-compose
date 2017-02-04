#!/bin/bash

if [[ ! -d "$NAMENODE_DFS_DIR" ]]; then
  echo "Namenode name directory not found: $NAMENODE_DFS_DIR"
  exit 2
fi

if [[ -z "$CLUSTER_NAME" ]]; then
  echo "Cluster name not specified"
  exit 2
fi

if [[ "$(ls -A "$NAMENODE_DFS_DIR")" == "" ]]; then
  echo "Formatting namenode name directory: $NAMENODE_DFS_DIR"
  "${HADOOP_PREFIX}/bin/hdfs" --config "$HADOOP_CONF_DIR" namenode -format "$CLUSTER_NAME" 
fi

"${HADOOP_PREFIX}/bin/hdfs" --config "$HADOOP_CONF_DIR" namenode
