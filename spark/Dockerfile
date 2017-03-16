FROM bf16574403/hadoop

ENV SPARK_VERSION=2.1.0
ENV HADOOP_VERSION=2.7
ENV SPARK_URL=http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN \
    curl -fSL "$SPARK_URL" -o /tmp/spark.tgz && \
    tar -xvf /tmp/spark.tgz -C /opt/ && \
    mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark && \
    rm /tmp/spark.tgz*
