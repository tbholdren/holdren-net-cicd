#!/bin/bash

APP_USERNAME=holdrennet
APP_GROUP=${APP_USERNAME}
APP_HOME=$(getent passwd ${APP_USERNAME}|cut -d: -f6)

# copy scripts from here to app user folder
# we shouold be in the /tmp/git/holdren-net-cicd folder
if [ -d "${APP_HOME}/holdren-net-cicd" ]; then
    cp -Rv . ${APP_HOME}
    chown -Rv ${APP_USERNAME}:${APP_GROUP} ${APP_HOME}/holdren-net-cicd
fi
