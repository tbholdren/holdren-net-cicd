#!/bin/bash

APP_USERNAME=holdrennet
APP_GROUP=${APP_USERNAME}

# add group first
if ! getent group ${APP_GROUP} > /dev/null; then
    echo group ${APP_GROUP} does not exist\; creating
    groupadd ${APP_GROUP}
fi


if ! id "${APP_USERNAME}" > /dev/null 2>&1; then
    echo user ${APP_USERNAME} does not exist\; creating
    useradd -g ${APP_GROUP} ${APP_USERNAME}
fi
