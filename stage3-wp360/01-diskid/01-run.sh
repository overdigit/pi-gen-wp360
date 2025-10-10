#!/bin/bash -e

#install -m 755 files/wp360-firstboot "${ROOTFS_DIR}/usr/local/sbin/"
sed 's|/usr/lib/raspberrypi-sys-mods/firstboot|/usr/local/sbin/wp360-firstboot|' -i "${ROOTFS_DIR}/boot/firmware/cmdline.txt"
sed \
  -e 's|^\s*DISKID=.*$|  DISKID="$(cut /sys/class/net/eth0/address -d: -f3-6 --output-delimiter=)"|' \
  -e 's|init=/usr/lib/raspberrypi-sys-mods/firstboot|init=/usr/local/sbin/wp360-firstboot|' \
  "${ROOTFS_DIR}/usr/lib/raspberrypi-sys-mods/firstboot" > "${ROOTFS_DIR}/usr/local/sbin/wp360-firstboot"

chmod +x "${ROOTFS_DIR}/usr/local/sbin/wp360-firstboot"

