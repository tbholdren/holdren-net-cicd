#!/bin/bash

# setup swap
bash swap-setup.sh

# setup user app will run as
bash user-setup.sh

# install docker
bash docker-setup.sh

# now install apps
bash web-setup.sh
