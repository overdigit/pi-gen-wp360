#!/bin/bash -e

install -m 644 files/codemeter-lite_8.20.6539.500_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesyscontrol_linuxarm64_4.15.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesysedge_edgearm64_4.15.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/wp360-ups-ctrl-1.0.0.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  export CONTAINER=true
  dpkg -i /codemeter-lite_8.20.6539.500_arm64.deb
  dpkg -i /codesyscontrol_linuxarm64_4.15.0.0_arm64.deb
  dpkg -i /codesysedge_edgearm64_4.15.0.0_arm64.deb
  dpkg -i /wp360-ups-ctrl-1.0.0.deb

  rm /codemeter-lite_8.20.6539.500_arm64.deb
  rm /codesyscontrol_linuxarm64_4.15.0.0_arm64.deb
  rm /codesysedge_edgearm64_4.15.0.0_arm64.deb
  rm /wp360-ups-ctrl-1.0.0.deb
  

  systemctl enable wp360-ups-ctrl
  systemctl enable codesyscontrol
  systemctl enable codesysedge
EOF
