#### kafka版本：2.5.0

#### docker镜像环境变量

|参数名称|默认值|说明|
|:---|:---|:---|
|KAFKA_BROKER_ID|0|broker.id|
|KAFKA_LISTENERS|PLAINTEXT://:9092|listeners|
|KAFKA_ZOOKEEPER_CONNECT|localhost:2181|zookeeper.connect|
|KAFKA_NUM_NETWORK_THREADS|3|num.network.threads|
|KAFKA_NUM_IO_THREADS|8|num.io.threads|
|KAFKA_SOCKET_SEND_BUFFER_BYTES|102400|socket.send.buffer.bytes|
|KAFKA_SOCKET_RECEIVE_BUFFER_BYTES|102400|socket.receive.buffer.bytes|
|KAFKA_SOCKET_REQUEST_MAX_BYTES|104857600|socket.request.max.bytes|
|KAFKA_NUM_PARTITIONS|1|num.partitions|
|KAFKA_RECOVERY_THREADS_PER_DATA_DIR|1|num.recovery.threads.per.data.dir|
|KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR|1|offsets.topic.replication.factor|
|KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR|1|transaction.state.log.replication.factor|
|KAFKA_TRANSACTION_STATE_LOG_MIN_ISR|1|transaction.state.log.min.isr|
|KAFKA_LOG_RETENTION_HOURS|168|log.retention.hours|
|KAFKA_LOG_SEGMENT_BYTES|1073741824|log.segment.bytes|
|KAFKA_RETENTION_CHECK_INTERVAL_MS|300000|log.retention.check.interval.ms|
|KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS|18000|zookeeper.connection.timeout.ms|
|KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS|0|group.initial.rebalance.delay.ms|
|KAFKA_ADVERTISED_LISTENERS||advertised.listeners|
|KAFKA_LOG_FLUSH_INTERVAL_MESSAGES||log.flush.interval.messages|
|KAFKA_LOG_FLUSH_INTERVAL_MS||log.flush.interval.ms|

#### docker启动示例：
```
docker run -d -p 9092:9092 --restart=always \
    -e KAFKA_ZOOKEEPER_CONNECT=zoo1:2181,zoo2:2181,zoo3:2181 \
    caliahub/kafka:2.5.0
```

#### docker-compose启动示例：
```
version: '3'
services:
  kafka1:
    image: caliahub/kafka:2.5.0
    restart: always
    hostname: kafka1
    ports:
      - 9092:9092
    environment:
      KAFKA_ZOOKEEPER_CONNECT: zoo1:2181,zoo2:2181,zoo3:2181

  kafka2:
    image: caliahub/kafka:2.5.0
    restart: always
    hostname: kafka2
    ports:
      - 9093:9092
    environment:
      KAFKA_ZOOKEEPER_CONNECT: zoo1:2181,zoo2:2181,zoo3:2181

  kafka3:
    image: caliahub/kafka:2.5.0
    restart: always
    hostname: kafka3
    ports:
      - 9094:9092
    environment:
      KAFKA_ZOOKEEPER_CONNECT: zoo1:2181,zoo2:2181,zoo3:2181
```
