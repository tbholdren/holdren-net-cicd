#!/bin/bash

APP_USERNAME=holdrennet
APP_GROUP=${APP_USERNAME}
APP_HOME=$(getent passwd ${APP_USERNAME}|cut -d: -f6)
HNCICD_DIR=${APP_HOME}/holdren-net-cicd

# copy scripts from here to app user folder
# we shouold be in the /tmp/git/holdren-net-cicd folder
if [ ! -d "${HNCICD_DIR}" ]; then
    cp -Rv . ${HNCICD_DIR}
    chown -Rv ${APP_USERNAME}:${APP_GROUP} ${HNCICD_DIR}
fi

# run scripts as user
cd ${HNCICD_DIR}
sudo -u ${APP_USERNAME} bash web-setup2.sh
