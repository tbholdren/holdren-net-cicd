#!/bin/bash

# stuff to do to prep the system for starting the containers

NETWORK=${NETWORK:-holdren-net}

network_exists=$(docker network ls|grep ${NETWORK})

if [ -z "${network_exists}" ]; then
    echo creating network
    docker network create --driver bridge ${NETWORK}
fi
