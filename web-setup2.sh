#!/bin/bash

pwd

cd docker

# clone credentials repository
if [ ! -d "holdren-net-credentials" ]; then
    git clone https://github.com/tbholdren/holdren-net-credentials.git
fi

source holdren-net-credentials/credentials.sh

# setup docker networking
bash holdren-net-setup.sh

# install mysql
bash mysql-run.sh
