#!/bin/bash

install -m 600 files/eth0.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth0.nmconnection"
sed "s/uuid=/uuid=$(uuidgen)/" -i "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth0.nmconnection"
