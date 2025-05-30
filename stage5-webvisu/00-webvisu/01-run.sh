#!/bin/bash -e

install -m 644 files/wp360-webvisu.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-webvisu.deb
  rm /wp360-webvisu.deb

  sudo -u $FIRST_USER_NAME systemctl --user enable sway
  sudo -u $FIRST_USER_NAME systemctl --user enable webvisu
EOF

sed -i 's/%USER%/'"${FIRST_USER_NAME}"'/g' "${ROOTFS_DIR}/usr/lib/systemd/system/codesyscontrol.service.d/10-codesys-user-target.conf"
