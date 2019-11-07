#!/bin/bash

# this file will setup a swap file (defaults to 1G) and add it to fstab
# if it doesn' exist
# please run with sudo

SWAPFILE=/swapfile
SWAPSIZE=1048576
if [ -z "$(swapon -s)" ]; then
    echo no swap detected
    if [ ! -f $SWAPFILE ]; then
	echo no swapfile found\; creating
        dd if=/dev/zero of=${SWAPFILE} bs=1024 count=${SWAPSIZE}
	chmod 600 ${SWAPFILE}
	mkswap ${SWAPFILE}
    fi

    echo turning on swap
    swapon ${SWAPFILE}
fi

if [ -z "$(grep ${SWAPFILE} /etc/fstab)" ]; then
    echo no fstab swap entry found\; adding
    echo "${SWAPFILE} none swap sw 0 0" >> /etc/fstab
fi


