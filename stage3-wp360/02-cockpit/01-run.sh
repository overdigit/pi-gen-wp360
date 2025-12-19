#!/bin/bash

install -m 644 files/apps.override.json "${ROOTFS_DIR}/etc/cockpit/"
install -m 644 files/systemd.override.json "${ROOTFS_DIR}/etc/cockpit/"
