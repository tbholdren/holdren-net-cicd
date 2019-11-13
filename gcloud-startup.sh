#!/bin/bash

# install git
apt update
apt install -y git

# make git dir
cd /tmp
mkdir -p git
cd git

# download our scripts
git clone https://github.com/tbholdren/holdren-net-cicd.git
cd holdren-net-cicd

# hand off to setup script
bash setup.sh

# cleanup
cd /tmp
rm -rf git
