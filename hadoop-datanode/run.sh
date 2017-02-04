#!/bin/bash

if [[ ! -d "$DATANODE_DFS_DIR" ]]; then
  echo "Datanode data directory not found: $DATANODE_DFS_DIR"
  exit 2
fi

"${HADOOP_PREFIX}/bin/hdfs" --config "$HADOOP_CONF_DIR" datanode
