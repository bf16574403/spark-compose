#!/bin/sh

sed "s/zookeeper.connect=.*/zookeeper.connect=${ZOOKEEPER_SERVERS}/g" -i /opt/kafka/config/server.properties
exec /opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
