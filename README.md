Build images:
```
bash build-images.sh
```

Push images to remote:
```
bash push-images.sh bf16574403
```

# Docker compose

Start environment:
```
docker-compose up (this will be in fronted mode, open new shell to run docker commands or add "-d" swith to this command)
```

URLs:
```
http://localhost:50070 (namenode)
http://localhost:8088/cluster (Resource manager - Yarn)
```

Run sample cluster job from spark-master container. Connect to the container:
```
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
```

Browse the filesystem: http://localhost:50070/explorer.html

Kill the environment:
```
docker-compose kill
docker-compose rm -f
```

# Kubernetes

Create kube secret to be able to pull private images on kube nodes:
```
kubectl create secret docker-registry regsecret --docker-username=bf16574403 --docker-password='PASSWORD' --docker-email=bosanac@inbox.com
```

Create all resorces from directory:
```
kubectl create -f spark-compose/kube -R
```

Check pods:
```
kubectl get pods -o wide
```
