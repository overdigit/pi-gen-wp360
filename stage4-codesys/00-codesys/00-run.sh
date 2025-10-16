#!/bin/bash -e

install -m 644 files/codemeter-lite_8.30.6885.501_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesyscontrol_linuxarm64_4.17.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesysedge_edgearm64_4.17.0.0_arm64.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
# CONTAINER prevents these packages from starting their service on configure
  export CONTAINER=true
  dpkg -i /codemeter-lite_8.30.6885.501_arm64.deb
  dpkg -i /codesyscontrol_linuxarm64_4.17.0.0_arm64.deb
  dpkg -i /codesysedge_edgearm64_4.17.0.0_arm64.deb
  rm /codemeter-lite_8.30.6885.501_arm64.deb
  rm /codesyscontrol_linuxarm64_4.17.0.0_arm64.deb
  rm /codesysedge_edgearm64_4.17.0.0_arm64.deb
EOF

cat >> "${ROOTFS_DIR}/etc/codesyscontrol/CODESYSControl_User.cfg" <<- \EOF
[SysCom]
Linux.Devicefile.2=/dev/ttyWP360-2
Linux.Devicefile.3=/dev/ttyWP360-3
Linux.Devicefile.4=/dev/ttyWP360-4

[SysFile]
PlaceholderFilePath.1=/media/user,$DRIVES$
PlaceholderFilePath.1.Volatile=1
EOF

on_chroot <<- \EOF
  systemctl enable codesyscontrol
  systemctl enable codesysedge
EOF
