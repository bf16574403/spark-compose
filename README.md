# Main dir:
cd hadoop-spark

# Build images:
bash build-images.sh

# Start environment:
docker-compose up (this will be in fronted mode, open new shell to run docker commands or add "-d" swith to this command)

# URLs:
http://localhost:50070 (namenode)
http://localhost:8088/cluster (Resource manager - Yarn)

# Run sample cluster job from spark-master container. Connect to the container:
docker exec -i -t spark-master bash

cd /opt/spark

./bin/spark-submit \
--class org.apache.spark.examples.SparkPi \
--master yarn \
--deploy-mode cluster \
--driver-memory 1g \
--executor-memory 1g \
--executor-cores 1 \
examples/jars/spark-examples_2.11-2.1.0.jar

# Browse the filesystem:
http://localhost:50070/explorer.html

# Kill the environment:
docker-compose kill
docker-compose rm -f
