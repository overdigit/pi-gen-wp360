#!/bin/bash -e

install -m 644 files/clock.sh   "${ROOTFS_DIR}/home/user/"
install -m 644 files/avg.lua    "${ROOTFS_DIR}/home/user/"
install -m 644 files/graph.lua  "${ROOTFS_DIR}/home/user/"
install -m 644 files/run.screen "${ROOTFS_DIR}/home/user/"
install -m 644 files/run.sh     "${ROOTFS_DIR}/home/user/"
