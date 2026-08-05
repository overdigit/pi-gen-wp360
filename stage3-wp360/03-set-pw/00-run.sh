#!/bin/bash

case "$IMG_NAME" in
  wp360-test)
    exit 0
  ;;
esac

install -d -m 755 "${ROOTFS_DIR}/usr/local/share/set_pw"
install -m 755 files/set_pw "${ROOTFS_DIR}/usr/local/share/set_pw/"

install -d -m 755 "${ROOTFS_DIR}/usr/local/lib/systemd/system/"
install -m 644 files/set_pw.service "${ROOTFS_DIR}/usr/local/lib/systemd/system/"

install -d -m 755 "${ROOTFS_DIR}/etc/systemd/system/default.target.wants/"
ln -s /usr/local/lib/systemd/system/set_pw.service "${ROOTFS_DIR}/etc/systemd/system/default.target.wants/"
