#!/bin/bash

# setup swap
bash swap-setup.sh

# install docker
bash docker-setup.sh

# setup user app will run as
bash user-setup.sh
