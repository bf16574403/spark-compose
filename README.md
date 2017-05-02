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

Create environments:
```
kubectl create namespace green
kubectl create namespace blue
```

Create kube secret to be able to pull private images on kube nodes for each env:
```
kubectl create secret docker-registry regsecret --docker-username=bf16574403 --docker-password='PASSWORD' --docker-email=bosanac@inbox.com --namespace=green
kubectl create secret docker-registry regsecret --docker-username=bf16574403 --docker-password='PASSWORD' --docker-email=bosanac@inbox.com --namespace=blue
```

Create all resources from directory for each env:
```
kubectl create -f spark-compose/kube -R --namespace=green
kubectl create -f spark-compose/kube -R --namespace=blue
```

Check pods:
```
kubectl get pods -o wide --all-namespacs
```

Run a command in a container:
```
kubectl exec spark-master-2453669239-tfbzs --namespace=green -- ps -ef
```

Check logs for a container:
```
kubectl logs spark-master-2453669239-tfbzs --namespace=green
```

Delete all resources from directory for each env:
```
kubectl delete -f spark-compose/kube -R --namespace=green
kubectl delete -f spark-compose/kube -R --namespace=blue
```

Kibana dash needs to be configured manually. Open Kibana dash and replace ```logstash-*``` with ```filebeat-*```. Click on create and you should see logs on Discover.

