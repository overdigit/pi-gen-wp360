#!/bin/bash -e

install -m 644 files/wp360-rescue.deb "${ROOTFS_DIR}/"
install -m 644 files/wp360-sys-mods.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-rescue.deb
  dpkg -i /wp360-sys-mods.deb
  rm /wp360-rescue.deb
  rm /wp360-sys-mods.deb
EOF
