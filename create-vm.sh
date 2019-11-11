#!/bin/bash

# create instance and run gcloud-startup.sh afterwards
gcloud beta compute --project=holdren-net \
  instances create holdren-net-web \
  --zone=us-east1-b \
  --machine-type=f1-micro \
  --subnet=default \
  --network-tier=PREMIUM \
  --maintenance-policy=MIGRATE \
  --service-account=801849299465-compute@developer.gserviceaccount.com \
  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --tags=http-server,https-server \
  --image=debian-10-buster-v20191014 \
  --image-project=debian-cloud \
  --boot-disk-size=10GB \
  --boot-disk-type=pd-standard \
  --boot-disk-device-name=holdren-net-web \
  --reservation-affinity=any \
  --metadata-from-file startup-script=gcloud-startup.sh
