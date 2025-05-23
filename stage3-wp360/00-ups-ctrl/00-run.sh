#!/bin/bash -e

install -m 644 files/wp360-ups-ctrl-1.0.0.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-ups-ctrl-1.0.0.deb
  rm /wp360-ups-ctrl-1.0.0.deb
EOF
