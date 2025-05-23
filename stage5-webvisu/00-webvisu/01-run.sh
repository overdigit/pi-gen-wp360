#!/bin/bash -e

#dpkg --root "${ROOTFS_DIR}/" -i "files/wp360-webvisu-1.0.0.deb"
install -m 644 files/wp360-webvisu-1.0.0.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /wp360-webvisu-1.0.0.deb
  rm /wp360-webvisu-1.0.0.deb

  sudo -u $FIRST_USER_NAME systemctl --user enable sway
  sudo -u $FIRST_USER_NAME systemctl --user enable webvisu
EOF

sed -i 's/%USER%/'"${FIRST_USER_NAME}"'/g' "${ROOTFS_DIR}/usr/lib/systemd/system/codesyscontrol.service.d/10-codesys-user-target.conf"
