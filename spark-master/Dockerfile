FROM test/spark

COPY run.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8080 7077 6066

CMD ["/run.sh"]
