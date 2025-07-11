#!/bin/bash -e

install -m 644 files/wp360-serial-map.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-serial-map.deb
  rm /wp360-serial-map.deb
EOF
