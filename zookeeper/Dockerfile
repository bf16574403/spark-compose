FROM bf16574403/java

ENV ZOOKEEPER_VERSION 3.4.9
ENV ZOOKEEPER_URL=http://apache.mirrors.ovh.net/ftp.apache.org/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz
ENV ZOOKEEPER_ID=1
ENV ZOOKEEPER_DATA_DIR=/data/zookeeper
ENV ZOOKEEPER_SERVER=zookeeper1

RUN \
    curl -fSL "$ZOOKEEPER_URL" -o /tmp/zookeeper.tar.gz && \
    tar -xvf /tmp/zookeeper.tar.gz -C /opt && \
    mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper && \
    rm /tmp/zookeeper.tar.gz

RUN mkdir -p "$ZOOKEEPER_DATA_DIR"
VOLUME "$ZOOKEEPER_DATA_DIR"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 2181 2888 3888

CMD ["/run.sh"]
