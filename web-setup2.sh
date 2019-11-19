#!/bin/bash

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
