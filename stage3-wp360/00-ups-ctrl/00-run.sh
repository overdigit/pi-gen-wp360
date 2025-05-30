#!/bin/bash -e

install -m 644 files/wp360-ups-ctrl.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-ups-ctrl.deb
  rm /wp360-ups-ctrl.deb
EOF
