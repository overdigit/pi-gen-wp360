#!/bin/bash -e

PKGNAME=wp360-test-tools

install -m 644 files/wp360-test-tools.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-test-tools.deb
  rm /wp360-test-tools.deb
EOF
