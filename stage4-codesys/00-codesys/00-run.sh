#!/bin/bash -e

install -m 644 files/codemeter-lite_8.40.7131.502_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesyscontrol_linuxarm64_4.20.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesysedge_edgearm64_4.20.0.0_arm64.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
# CONTAINER prevents these packages from starting their service on configure
  export CONTAINER=true
  dpkg -i /codemeter-lite_8.40.7131.502_arm64.deb
  dpkg -i /codesyscontrol_linuxarm64_4.20.0.0_arm64.deb
  dpkg -i /codesysedge_edgearm64_4.20.0.0_arm64.deb
  rm /codemeter-lite_8.40.7131.502_arm64.deb
  rm /codesyscontrol_linuxarm64_4.20.0.0_arm64.deb
  rm /codesysedge_edgearm64_4.20.0.0_arm64.deb
EOF

on_chroot <<- \EOF
  systemctl enable codesyscontrol
  systemctl enable codesysedge
EOF
