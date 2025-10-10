#!/bin/bash -e

on_chroot <<- \EOF
  sudo -u $FIRST_USER_NAME systemctl --user enable sway
  sudo -u $FIRST_USER_NAME systemctl --user enable webvisu
EOF

sed -i 's/%USER%/'"${FIRST_USER_NAME}"'/g' "${ROOTFS_DIR}/usr/lib/systemd/system/codesyscontrol.service.d/10-codesys-user-target.conf"
