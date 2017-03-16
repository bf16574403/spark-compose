#!/bin/bash

if [[ -z "$ZOOKEEPER_ID" ]]; then
  exit 1
fi

echo "$ZOOKEEPER_ID" > /data/zookeeper/myid

cat > /opt/zookeeper/conf/zoo.cfg <<EOF
tickTime=2000
initLimit=10
syncLimit=5
dataDir=${ZOOKEEPER_DATA_DIR}
clientPort=2181
maxClientCnxns=100
autopurge.snapRetainCount=2
autopurge.purgeInterval=1
EOF

if [[ -n "$ZOOKEEPER_SERVERS" ]]; then
  printf '%s' "$ZOOKEEPER_SERVERS" | awk 'BEGIN { RS = "," }; { printf "server.%i=%s\n", NR, $0 }' >> /opt/zookeeper/conf/zoo.cfg
fi

exec /opt/zookeeper/bin/zkServer.sh start-foreground
