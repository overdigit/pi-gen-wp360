#!/bin/bash -e

# codemeter-lite_8.20.6539.500_arm64.deb  codesyscontrol_linuxarm64_4.15.0.0_arm64.deb  codesysedge_edgearm64_4.15.0.0_arm64.deb

install -m 644 files/codemeter-lite_8.20.6539.500_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesyscontrol_linuxarm64_4.15.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesysedge_edgearm64_4.15.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/ups_ctrl-1.0.0.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  export CONTAINER=true
  dpkg -i /codemeter-lite_8.20.6539.500_arm64.deb
  dpkg -i /codesyscontrol_linuxarm64_4.15.0.0_arm64.deb
  dpkg -i /codesysedge_edgearm64_4.15.0.0_arm64.deb
  dpkg -i /ups_ctrl-1.0.0.deb

  systemctl enable ups-ctrl
EOF
