#!/bin/bash

# Generate the config only if it doesn't exist
#	KAFKA_BROKER_ID=0
#	KAFKA_LISTENERS=PLAINTEXT://:9092
#	KAFKA_ZOOKEEPER_CONNECT=localhost:2181
#	
#	KAFKA_NUM_NETWORK_THREADS=3 
#	KAFKA_NUM_IO_THREADS=8
#	KAFKA_SOCKET_SEND_BUFFER_BYTES=102400
#	KAFKA_SOCKET_RECEIVE_BUFFER_BYTES=102400
#	KAFKA_SOCKET_REQUEST_MAX_BYTES=104857600
#	KAFKA_NUM_PARTITIONS=1
#	KAFKA_RECOVERY_THREADS_PER_DATA_DIR=1
#	KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1
#	KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1
#	KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1
#	KAFKA_LOG_RETENTION_HOURS=168
#	KAFKA_LOG_SEGMENT_BYTES=1073741824
#	KAFKA_RETENTION_CHECK_INTERVAL_MS=300000
#	KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS=18000
#	KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS=0
#	
#	KAFKA_ADVERTISED_LISTENERS
#	KAFKA_LOG_FLUSH_INTERVAL_MESSAGES
#	KAFKA_LOG_FLUSH_INTERVAL_MS

set -e

if [[ ! -f "${KAFKA_DIR}/config/server.properties" ]]; then
    CONFIG="${KAFKA_DIR}/config/server.properties"
    {
		# broker.id=0
		# listeners=PLAINTEXT://:9092
		# zookeeper.connect=localhost:2181
		# log.dirs=${KAFKA_DIR}/logs
        echo "broker.id=${KAFKA_BROKER_ID}" 
        echo "listeners=${KAFKA_LISTENERS}"
	echo "zookeeper.connect=${KAFKA_ZOOKEEPER_CONNECT}"
	echo "log.dirs=${KAFKA_DIR}/logs"
    } >> "${CONFIG}"
	
	# num.network.threads=3
    if [[ -z ${KAFKA_NUM_NETWORK_THREADS} ]]; then
	echo "num.network.threads=3" >> "${CONFIG}"
    else
	echo "num.network.threads=${KAFKA_NUM_NETWORK_THREADS}" >> "${CONFIG}"
    fi
	# num.io.threads=8
	if [[ -z ${KAFKA_NUM_IO_THREADS} ]]; then
		echo "num.io.threads=8" >> "${CONFIG}"
	else
		echo "num.io.threads=${KAFKA_NUM_IO_THREADS}" >> "${CONFIG}"
    fi
	# socket.send.buffer.bytes=102400
	if [[ -z ${KAFKA_SOCKET_SEND_BUFFER_BYTES} ]]; then
		echo "socket.send.buffer.bytes=102400" >> "${CONFIG}"
	else
		echo "socket.send.buffer.bytes=${KAFKA_SOCKET_SEND_BUFFER_BYTES}" >> "${CONFIG}"
    fi
	# socket.receive.buffer.bytes=102400
	if [[ -z ${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES} ]]; then
		echo "socket.receive.buffer.bytes=102400" >> "${CONFIG}"
	else
		echo "socket.receive.buffer.bytes=${KAFKA_SOCKET_RECEIVE_BUFFER_BYTES}" >> "${CONFIG}"
    fi
	# socket.request.max.bytes=104857600
	if [[ -z ${KAFKA_SOCKET_REQUEST_MAX_BYTES} ]]; then
		echo "socket.request.max.bytes=104857600" >> "${CONFIG}"
	else
		echo "socket.request.max.bytes=${KAFKA_SOCKET_REQUEST_MAX_BYTES}" >> "${CONFIG}"
    fi
	# num.partitions=1
	if [[ -z ${KAFKA_NUM_PARTITIONS} ]]; then
		echo "num.partitions=1" >> "${CONFIG}"
	else
		echo "num.partitions=${KAFKA_NUM_PARTITIONS}" >> "${CONFIG}"
    fi
	# num.recovery.threads.per.data.dir=1
	if [[ -z ${KAFKA_RECOVERY_THREADS_PER_DATA_DIR} ]]; then
		echo "num.recovery.threads.per.data.dir=1" >> "${CONFIG}"
	else
		echo "num.recovery.threads.per.data.dir=${KAFKA_RECOVERY_THREADS_PER_DATA_DIR}" >> "${CONFIG}"
    fi
	# offsets.topic.replication.factor=1
	if [[ -z ${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR} ]]; then
		echo "offsets.topic.replication.factor=1" >> "${CONFIG}"
	else
		echo "offsets.topic.replication.factor=${KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR}" >> "${CONFIG}"
    fi
	# transaction.state.log.replication.factor=1
	if [[ -z ${KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR} ]]; then
		echo "transaction.state.log.replication.factor=1" >> "${CONFIG}"
	else
		echo "transaction.state.log.replication.factor=${KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR}" >> "${CONFIG}"
    fi
	# transaction.state.log.min.isr=1
	if [[ -z ${KAFKA_TRANSACTION_STATE_LOG_MIN_ISR} ]]; then
		echo "transaction.state.log.min.isr=1" >> "${CONFIG}"
	else
		echo "transaction.state.log.min.isr=${KAFKA_TRANSACTION_STATE_LOG_MIN_ISR}" >> "${CONFIG}"
    fi
	# log.retention.hours=168
	if [[ -z ${KAFKA_LOG_RETENTION_HOURS} ]]; then
		echo "log.retention.hours=168" >> "${CONFIG}"
	else
		echo "log.retention.hours=${KAFKA_LOG_RETENTION_HOURS}" >> "${CONFIG}"
    fi
	# log.segment.bytes=1073741824
	if [[ -z ${KAFKA_LOG_SEGMENT_BYTES} ]]; then
		echo "log.segment.bytes=1073741824" >> "${CONFIG}"
	else
		echo "log.segment.bytes=${KAFKA_LOG_SEGMENT_BYTES}" >> "${CONFIG}"
    fi
	# log.retention.check.interval.ms=300000
	if [[ -z ${KAFKA_RETENTION_CHECK_INTERVAL_MS} ]]; then
		echo "log.retention.check.interval.ms=300000" >> "${CONFIG}"
	else
		echo "log.retention.check.interval.ms=${KAFKA_RETENTION_CHECK_INTERVAL_MS}" >> "${CONFIG}"
    fi
	# zookeeper.connection.timeout.ms=18000
	if [[ -z ${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS} ]]; then
		echo "zookeeper.connection.timeout.ms=18000" >> "${CONFIG}"
	else
		echo "zookeeper.connection.timeout.ms=${KAFKA_ZOOKEEPER_CONNECTION_TIMEOUT_MS}" >> "${CONFIG}"
    fi
	# zgroup.initial.rebalance.delay.ms=0
	if [[ -z ${KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS} ]]; then
		echo "group.initial.rebalance.delay.ms=0" >> "${CONFIG}"
	else
		echo "group.initial.rebalance.delay.ms=${KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS}" >> "${CONFIG}"
    fi

	# advertised.listeners=PLAINTEXT://your.host.name:9092
    if [[ -n ${KAFKA_ADVERTISED_LISTENERS} ]]; then
        echo "advertised.listeners=${KAFKA_ADVERTISED_LISTENERS}" >> "${CONFIG}"
    fi
	# log.flush.interval.messages=10000
    if [[ -n ${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES} ]]; then
        echo "log.flush.interval.messages==${KAFKA_LOG_FLUSH_INTERVAL_MESSAGES}" >> "${CONFIG}"
    fi
	# log.flush.interval.ms=1000
	if [[ -n ${KAFKA_LOG_FLUSH_INTERVAL_MS} ]]; then
        echo "log.flush.interval.ms=${KAFKA_LOG_FLUSH_INTERVAL_MS}" >> "${CONFIG}"
    fi
fi

exec "$@"
