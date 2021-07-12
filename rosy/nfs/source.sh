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
export KERNEL_BRANCH=Q-R
export DEVICE_CODENAME=rosy
export DEVICE_DEFCONFIG=NeedForSpeed_defconfig
export ANYKERNEL=https://github.com/AnGgIt86/AnyKernel3
export TG_TOKEN=1852697615:AAGKDF9cYNnTY4Ylm7XjBrsssS31eTtqYfk
export TG_CHAT_ID=-1001580307414
export BUILD_USER=xiaomi
export BUILD_HOST=nfs-projects
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
export BOT_MSG_URL2="https://api.telegram.org/bot$TG_TOKEN"
git config --global user.email "jarbull86@gmail.com"
git config --global user.name "AnGgIt86"

tg_post_msg() {
  curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHAT_ID" \
  -d "disable_web_page_preview=true" \
  -d "parse_mode=html" \
  -d text="$1"

}
echo "Downloading few Dependecies . . ."
# Kernel Sources
git clone --depth=1 $KERNEL_SOURCE -b $KERNEL_BRANCH $DEVICE_CODENAME
git clone --depth=1 https://github.com/mvaisakh/gcc-arm64 GCC
git clone --depth=1 https://github.com/AnGgIt86/NFS-TC.git NFS-Toolchain
git clone --depth=1 https://github.com/kdrag0n/proton-clang Proton

curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/nfs/GCC.sh -o GCC.sh
curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/nfs/NFS.sh -o NFS.sh
curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/nfs/Proton.sh -o Proton.sh
curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/nfs/rm.sh -o rm.sh

curl -s -X POST "$BOT_MSG_URL/sendSticker" \
        -d sticker="CAACAgUAAx0CXjGT1gACAeRg69dV3PYH_z8EZQnV9D9MubhVCwAClAAD7OCaHulbTgv4Q5nsIAQ" \
        -d chat_id="$TG_CHAT_ID"
        
tg_post_msg "<b>NFSKernel-Android-Q-R-(rosy):</b><code>Started build witch GCC</code>"
echo "Started build witch GCC"
bash GCC.sh
echo "membersihkan config sebelumnya"
bash rm.sh
tg_post_msg "<b>NFSKernel-Android-Q-R-(rosy):</b><code>Started build witch NFS Clang</code>"
echo "started build witch NFS Clang"
bash NFS.sh
echo "membersihkan config sebelumnya"
bash rm.sh
tg_post_msg "<b>NFSKernel-Android-Q-R-(rosy):</b><code>Started build witch Proton Clang</code>"
echo "started build witch Proton Clang"
bash Proton.sh
tg_post_msg "<b>NFSKernel-Android-Q-R-(rosy):</b><code>Building completed...</code>"
curl -s -X POST "$BOT_MSG_URL/sendSticker" \
        -d sticker="CAACAgIAAx0CXjGT1gACAeVg69gXIw-a6h1nvmmaub51tQQwCgACLQMAAsbMYwIquW4nbs0crSAE" \
        -d chat_id="$TG_CHAT_ID"
