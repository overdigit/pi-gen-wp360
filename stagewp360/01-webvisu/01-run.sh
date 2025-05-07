#!/bin/bash -e

install -m 755 -d "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/"
install -m 644 files/autologin.conf "${ROOTFS_DIR}/etc/systemd/system/getty@tty1.service.d/autologin.conf"
install -m 644 files/sway.service "${ROOTFS_DIR}/etc/systemd/user/sway.service"
install -m 755 -d "${ROOTFS_DIR}/etc/sway/config.d/"
install -m 644 files/51-systemd-user-target.conf "${ROOTFS_DIR}/etc/sway/config.d/51-systemd-user-target.conf"
install -m 644 files/sway-session.target "${ROOTFS_DIR}/etc/systemd/user/sway-session.target"
install -m 644 files/codesys.target "${ROOTFS_DIR}/etc/systemd/user/codesys.target"
install -m 644 files/webvisu.service "${ROOTFS_DIR}/etc/systemd/user/webvisu.service"
install -m 755 -d "${ROOTFS_DIR}/etc/systemd/system/codesyscontrol.service.d/"
install -m 644 files/10-codesys-user-target.conf "${ROOTFS_DIR}/etc/systemd/system/codesyscontrol.service.d/10-codesys-user-target.conf"

sed -i 's/%USER%/'"${FIRST_USER_NAME}"'/g' "${ROOTFS_DIR}/etc/systemd/system/codesyscontrol.service.d/10-codesys-user-target.conf"

on_chroot <<- \EOF
  sudo -u $FIRST_USER_NAME systemctl --user enable sway
  sudo -u $FIRST_USER_NAME systemctl --user enable webvisu
EOF
