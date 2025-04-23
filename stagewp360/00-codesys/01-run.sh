cat >> "${ROOTFS_DIR}/etc/codesyscontrol/CODESYSControl_User.cfg" <<- \EOF
[SysCom]
Linux.Devicefile.2=/dev/ttyAMA2
Linux.Devicefile.3=/dev/ttyAMA3
Linux.Devicefile.4=/dev/ttyAMA4
EOF

#for file in \
#  codemeter-lite_8.20.6539.500_arm64.deb \
#  ups_ctrl-1.0.0.deb \
#  codesyscontrol_linuxarm64_4.15.0.0_arm64.deb \
#  codesysedge_edgearm64_4.15.0.0_arm64.deb
#do
#  rm "${ROOTFS_DIR}/${file}.deb"
#done
