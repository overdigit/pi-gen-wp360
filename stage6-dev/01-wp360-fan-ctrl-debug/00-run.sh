#!/bin/bash -e

install -m 755 "${ROOTFS_DIR}/etc/systemd/system/wp360-fan-ctrl.d/
install -m 644 files/debug.conf   "${ROOTFS_DIR}/etc/systemd/system/wp360-fan-ctrl.d/debug.conf"
