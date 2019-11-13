#!/bin/bash

# install git if needed
if [ ! "$(command -v git)" ]; then
    apt update
    apt install -y git
fi

# make git dir
cd /tmp
mkdir -p git
cd git

# download our scripts
if [ ! -d "holdren-net-cicd"]; then
    git clone https://github.com/tbholdren/holdren-net-cicd.git
fi
cd holdren-net-cicd

# hand off to setup script
bash setup.sh

# cleanup
cd /tmp
rm -rf git
