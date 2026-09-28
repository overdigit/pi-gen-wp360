#!/bin/bash -e


case "$WP360_IMAGE" in
  full)
    exit 0
  ;;
  *)
    install -d 755 "${ROOTFS_DIR}/etc/systemd/system/wp360-fan-ctrl.d/"
    install -m 644 files/debug.conf   "${ROOTFS_DIR}/etc/systemd/system/wp360-fan-ctrl.d/debug.conf"
  ;;
esac
