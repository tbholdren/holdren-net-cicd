#!/bin/bash

MYSQL_CONTAINER="${MYSQL_CONTAINER:-holdren-net-mysql}"
MYSQL_DATA="${MYSQL_CONTAINER:-${HOME}/data/mysql}"

docker container stop ${MYSQL_CONTAINER}

docker container rm ${MYSQL_CONTAINER}

rm -rf ${MYSQL_DATA}
