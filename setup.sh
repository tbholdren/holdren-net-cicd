#!/bin/bash

# setup swap
bash swap-setup.sh

# setup user app will run as
bash user-setup.sh

# install docker
bash docker-setup.sh

# handoff to web installer
bash web-setup.sh
