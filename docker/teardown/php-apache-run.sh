#!/bin/bash

CONTAINER_NAME=holdren-net-php-apache

docker container stop ${CONTAINER_NAME}
docker container rm ${CONTAINER_NAME}
