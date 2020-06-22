FROM caliahub/jre:1.8.0_101

MAINTAINER Calia "cnboycalia@gmail.com"

ENV SCALA_VERSION=2.12 \
    KAFKA_VERSION=2.5.0 \
    KAFKA_DIR=/etc/kafka \
    KAFKA_BROKER_ID=0 \
    KAFKA_LISTENERS=PLAINTEXT://:9092 \
    KAFKA_ZOOKEEPER_CONNECT=localhost:2181
	
COPY docker-entrypoint.sh /usr/local/bin/

RUN set -eux; \
    cd /tmp; \
    addgroup -S kafka --gid=1000; \
    adduser -S -g kafka --uid=1000 kafka; \
    mkdir -p "${KAFKA_DIR}/logs" "${KAFKA_DIR}/bin"; \
    wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz; \
    tar -zxf "kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"; \
    mv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}/config" "${KAFKA_DIR}/"; \
    mv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}/libs" "${KAFKA_DIR}/"; \
    mv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin/kafka-server-start.sh" "${KAFKA_DIR}/bin/"; \
    mv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}/bin/kafka-run-class.sh" "${KAFKA_DIR}/bin/"; \
    rm -rf "${KAFKA_DIR}/config/zookeeper.properties" "${KAFKA_DIR}/config/server.properties" "kafka_${SCALA_VERSION}-${KAFKA_VERSION}"*; \
    chown -R kafka:kafka "${KAFKA_DIR}"

ENV PATH=$PATH:${KAFKA_DIR}/bin

WORKDIR ${KAFKA_DIR}

USER kafka

VOLUME ${KAFKA_DIR}/logs

EXPOSE 9092

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["kafka-server-start.sh", "config/server.properties"]
