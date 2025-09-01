#!/bin/bash -e

PKGNAME=wp360-test-tools

install -m 644 files/${PKGNAME}.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  apt install /${PKGNAME}.deb
  rm /${PKGNAME}.deb
EOF
