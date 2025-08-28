#!/bin/bash -e

install -m 644 files/wp360-fan-ctrl.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-fan-ctrl.deb
  rm /wp360-fan-ctrl.deb
EOF
