#!/bin/bash

export SPARK_MASTER_HOST=$(hostname)

. "/opt/spark/sbin/spark-config.sh"

. "/opt/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/opt/spark
export SPARK_MASTER_PORT=7077

cd /opt/spark/bin && \
   /opt/spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
   --host $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port 8080 >> $SPARK_MASTER_LOG/spark-master.out
