#!/bin/bash

install -m 600 files/static.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/static.nmconnection"
sed "s/uuid=/uuid=$(uuidgen)/" -i "${ROOTFS_DIR}/etc/NetworkManager/system-connections/static.nmconnection"
