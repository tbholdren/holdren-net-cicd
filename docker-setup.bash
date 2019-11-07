#!/bin/bash

# install the docker system
# run as root

if [ ! "$(command -v docker)" ]; then
    echo docker not found\; installing

    # pre-reqs
    apt update
    apt -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common

    # add docker gpg key to apt
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

    # add docker repo to apt
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian \
      $(lsb_release -cs) \
      stable"

    # update with new repo
    apt update

    # install docker
    apt -y install docker-ce docker-ce-cli containerd.io

fi

if ! getent group docker|grep &>/dev/null "\b$(logname)\b"; then
    echo $(logname) not in docker group\; adding

    usermod -aG docker $(logname)
    newgrp docker
fi
