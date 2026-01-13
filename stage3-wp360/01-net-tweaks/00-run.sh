#!/bin/bash

install -m 600 files/eth0.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth0.nmconnection"

for i in $(seq 1 3)
do
    install -m 600 files/ethN.nmconnection "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth${i}.nmconnection"
    sed "s/ethN/eth${i}/" -i "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth${i}.nmconnection"
    sed "s/uuid=/uuid=$(uuidgen)/" -i "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth${i}.nmconnection"
done

sed "s/uuid=/uuid=$(uuidgen)/" -i "${ROOTFS_DIR}/etc/NetworkManager/system-connections/eth0.nmconnection"
