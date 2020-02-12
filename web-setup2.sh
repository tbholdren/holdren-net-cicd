#!/bin/bash

HTML_DIR=html
HOLDREN_NET_WEB_DIR=holdren-net-web

pwd

cd docker

# clone credentials repository
if [ ! -f "credentials.sh" ]; then
    echo copying credentials
    gsutil cp gs://holdren-net/credentials/credentials.sh .
fi

source credentials.sh

# setup docker networking
bash holdren-net-setup.sh

# install mysql
bash mysql-run.sh

# build docker container for php with mysql bindings
cd holdren-net-php-apache
bash build.sh
cd ..

# create directory if it doesn't exist, set permissions
mkdir -p $HTML_DIR

# pull down html content
if [ ! -d "$HOLDREN_NET_WEB_DIR" ]; then
    git clone https://github.com/tbholdren/holdren-net-web.git
fi

# install php
bash holdren-net-php-apache-run.sh
