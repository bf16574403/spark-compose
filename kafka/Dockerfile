FROM bf16574403/java

ENV KAFKA_VERSION 0.10.1.0
ENV SCALA_VERSION 2.11
ENV KAFKA_URL=http://apache.mirrors.spacedump.net/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

RUN \
    curl -fSL "$KAFKA_URL" -o /tmp/kafka.tgz && \
    tar -xvf /tmp/kafka.tgz -C /opt && \
    mv /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka && \
    rm /tmp/kafka.tgz

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9092

CMD ["/run.sh"]
