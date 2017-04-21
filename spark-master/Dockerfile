FROM bf16574403/spark

COPY run.sh /

ENV SPARK_MASTER_LOG /spark/logs

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8080 7077 6066

CMD ["/run.sh"]
