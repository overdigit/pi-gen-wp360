#!/bin/bash -e
install -m 644 files/codemeter-lite_8.40.7131.502_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesyscontrol_linuxarm64_4.21.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesysedge_edgearm64_4.21.0.0_arm64.deb "${ROOTFS_DIR}/"
install -m 644 files/codesysproxy_proxyarm64_4.21.0.0_arm64.deb "${ROOTFS_DIR}/"

on_chroot <<- \EOF
  dpkg -i /codemeter-lite_8.40.7131.502_arm64.deb
  dpkg -i /codesyscontrol_linuxarm64_4.21.0.0_arm64.deb
  dpkg -i /codesysedge_edgearm64_4.21.0.0_arm64.deb
  dpkg -i /codesysproxy_proxyarm64_4.21.0.0_arm64.deb

  set +e
  # Let's try to stop CodeMeter before going on
  start-stop-daemon --stop --quiet --retry=TERM/5/KILL/5 --exec /usr/sbin/CodeMeterLin
  echo "Return code CodeMeterLin: $?"
  start-stop-daemon --stop --quiet --retry=TERM/5/KILL/5 --exec /usr/lib/CodeMeter
  echo "Return code CodeMeter: $?"
  while pgrep CodeMeter
  do
    echo "Killing CodeMeter..."
    pkill -SIGTERM CodeMeter
    sleep 2s
  done
  set -e

  rm /codemeter-lite_8.40.7131.502_arm64.deb
  rm /codesyscontrol_linuxarm64_4.21.0.0_arm64.deb
  rm /codesysedge_edgearm64_4.21.0.0_arm64.deb
  rm /codesysproxy_proxyarm64_4.21.0.0_arm64.deb

  usermod -aG dialout,gpio codesyscontrol
EOF

#on_chroot <<- \EOF
#  systemctl enable codesyscontrol
#  systemctl enable codesysedge
#EOF
