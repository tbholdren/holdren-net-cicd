#!/bin/bash

NETWORK=holdren-net
CONTAINER_NAME=holdren-net-php-apache
TAG=${CONTAINER_NAME}
APACHE_PORT=80

container_exists=$(docker ps -a|grep ${CONTAINER_NAME})
container_running=$(echo "${container_exists}"|grep Up)

# create container if needed
if [ -z "${container_exists}" ]; then
    echo creating container
    docker run -d -p ${APACHE_PORT}:80/tcp \
	   --name ${CONTAINER_NAME} \
	   --network ${NETWORK} \
	   -v "$PWD/html:/var/www/html" \
	   ${TAG}
fi

# start container if down
if [ -z "${container_running}" ]; then
    echo starting container
    docker container start ${CONTAINER_NAME}
fi
