FROM test/spark
MAINTAINER Alen Komljen <alen@crondev.com>

COPY run.sh /

ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8081

CMD ["/run.sh"]
