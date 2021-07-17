#!/usr/bin/env bash

export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export LOCALVERSION=
export TZ=Asia/Jakarta
export KERNEL_NAME=NFS-Kernel-4.9
export KERNEL_SOURCE=https://github.com/AnGgIt86/kernel_dark_ages_vince.git
export KERNEL_BRANCH=eleven
export DEVICE_CODENAME=vince
export DEVICE_DEFCONFIG=vince_defconfig
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

curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/vince/GCC.sh -o GCC.sh
curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/vince/NFS.sh -o NFS.sh
curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/vince/Proton.sh -o Proton.sh
curl https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/vince/rm.sh -o rm.sh

curl -s -X POST "$BOT_MSG_URL2/sendSticker" \
-d sticker="CAACAgUAAx0CXjGT1gACAvlg8oSTOTYDf4V3lQUf9H90S3jTmgACmAAD7OCaHtU9xsvVRzuSIAQ" \
-d chat_id="$TG_CHAT_ID"
        
tg_post_msg "<b>NFSKernel-Redmi 5 Plus (vince):</b><code>Started build witch GCC</code>"
echo "Started build witch GCC"
bash GCC.sh
echo "membersihkan config sebelumnya"
bash rm.sh
tg_post_msg "<b>NFSKernel-Redmi 5 Plus (vince):</b><code>Started build witch NFS Clang</code>"
echo "started build witch NFS Clang"
bash NFS.sh
echo "membersihkan config sebelumnya"
bash rm.sh
tg_post_msg "<b>NFSKernel-Redmi 5 Plus (vince):</b><code>Started build witch Proton Clang</code>"
echo "started build witch Proton Clang"
bash Proton.sh
tg_post_msg "<b>NFSKernel-Redmi 5 Plus (vince):</b><code>Building completed...</code>"
curl -s -X POST "$BOT_MSG_URL2/sendSticker" \
-d sticker="CAACAgIAAx0CXjGT1gACAeVg69gXIw-a6h1nvmmaub51tQQwCgACLQMAAsbMYwIquW4nbs0crSAE" \
-d chat_id="$TG_CHAT_ID"
