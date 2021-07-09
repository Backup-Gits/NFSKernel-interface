#!/usr/bin/env bash
#
# Copyright (C) 2021 a xyzprjkt property
#

export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export LOCALVERSION=
export TZ=Asia/Jakarta
export KERNEL_NAME=NFS-Kernel-4.9
export KERNEL_SOURCE=https://github.com/AnGgIt86/kernel_xiaomi_rosy-4.9.git
export KERNEL_BRANCH=eleven
export DEVICE_CODENAME=rosy
export DEVICE_DEFCONFIG=rosy-perf_defconfig
export ANYKERNEL=https://github.com/AnGgIt86/AnyKernel3
export TG_TOKEN=1852697615:AAGKDF9cYNnTY4Ylm7XjBrsssS31eTtqYfk
export TG_CHAT_ID=-1001580307414
export BUILD_USER=xiaomi
export BUILD_HOST=nfs-projects
git config --global user.email "jarbull86@gmail.com"
git config --global user.name "AnGgIt86"
# Main Declaration
KERNEL_ROOTDIR=$(pwd)/$DEVICE_CODENAME # IMPORTANT ! Fill with your kernel source root directory.
DEVICE_DEFCONFIG=$DEVICE_DEFCONFIG # IMPORTANT ! Declare your kernel source defconfig file here.
export KBUILD_BUILD_USER=$BUILD_USER # Change with your own name or else.
export KBUILD_BUILD_HOST=$BUILD_HOST # Change with your own hostname.

cd ${KERNEL_ROOTDIR}
make O=out clean && make O=out mrproper
