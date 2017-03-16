FROM bf16574403/java

ENV JAVA_HOME=/usr/java/default
ENV KAFKA_MANAGER_VERSION=1.3.3.4
ENV KAFKA_MANAGER_URL=https://github.com/yahoo/kafka-manager/archive/${KAFKA_MANAGER_VERSION}.tar.gz

RUN \
    yum -y install java-1.8.0-openjdk-devel && \
    curl -fSL "$KAFKA_MANAGER_URL" -o /tmp/kafka-manager.tar.gz && \
    tar -xvf /tmp/kafka-manager.tar.gz -C /tmp && \
    cd /tmp/kafka-manager-${KAFKA_MANAGER_VERSION} && ./sbt clean dist

RUN \
    yum -y install unzip && \
    unzip -d /opt /tmp/kafka-manager-${KAFKA_MANAGER_VERSION}/target/universal/kafka-manager-${KAFKA_MANAGER_VERSION}.zip && \
    mv /opt/kafka-manager-${KAFKA_MANAGER_VERSION} /opt/kafka-manager && \
    rm -fr /tmp/* /root/.sbt /root/.ivy2 && \
    yum autoremove -y java-1.8.0-openjdk-devel unzip && \
    yum clean all

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 9000

CMD ["/run.sh"]
