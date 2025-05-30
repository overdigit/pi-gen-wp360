#!/bin/bash -e

install -m 644 files/wp360-udiskie.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-udiskie.deb
  rm /wp360-udiskie.deb
EOF
