#!/bin/bash -e

on_chroot <<- \EOF
  sudo -u $FIRST_USER_NAME systemctl --user enable sway
  sudo -u $FIRST_USER_NAME systemctl --user enable webvisu
EOF
