#!/bin/bash -e

install -m 755 files/wp360-firstboot "${ROOTFS_DIR}/etc/initramfs-tools/scripts/local-premount/"

