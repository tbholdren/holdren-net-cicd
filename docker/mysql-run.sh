#!/bin/bash

set -u

NETWORK=${NETWORK:-holdren-net}
MYSQL_CONTAINER=${MYSQL_CONTAINER:-holdren-net-mysql}
MYSQL_VERSION=${MYSQL_VERSION:-5.7}
MYSQL_DATA=${MYSQL_DATA:-${HOME}/data/mysql}
MYSQL_PORT=${MYSQL_PORT:-3308}

# is the container running?
container_exists=$(docker ps -a|grep ${MYSQL_CONTAINER})
container_running=$(echo "${container_exists}"|grep Up)
echo $container_running

# create data directory if needed
if ! [ -d "${MYSQL_DATA}" ]; then
    echo creating data directory
    mkdir -p $MYSQL_DATA
fi

# create container if needed
if [ -z "${container_exists}" ]; then
    echo creating container
    docker run \
      --name ${MYSQL_CONTAINER} \
      --network ${NETWORK} \
      -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
      -v ${MYSQL_DATA}:/var/lib/mysql \
      -d mysql:${MYSQL_VERSION}
fi

# start container if stopped
if [ -z "${container_running}" ]; then
    echo starting container
    docker container start $MYSQL_CONTAINER
fi
