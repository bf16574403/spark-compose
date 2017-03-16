#!/bin/sh

exec /opt/kafka-manager/bin/kafka-manager -Dconfig.file=/opt/kafka-manager/conf/application.conf "${KAFKA_MANAGER_ARGS}" "${@}"
