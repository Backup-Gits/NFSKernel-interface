#!/usr/bin/env bash

export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export TZ=Asia/Jakarta
export KERNEL_NAME=Finix-Kernel
export KERNEL_SOURCE=https://github.com/AnGgIt88/kernel_msm-4.9
export KERNEL_BRANCH=a11/master
export DEVICE_CODENAME=rosy
export DEVICE_DEFCONFIG=rosy-perf_defconfig
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
git clone --depth=1 https://github.com/AnGgIt86/arm64-gcc NFS-Toolchain
git clone --depth=1 https://github.com/AnGgIt86/arm64-gcc NFS-Toolchain2
git clone --depth=1 https://github.com/AnGgIt86/NeedForSpeed-Clang NFS-Clang

wget https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/finix/NFS.sh
wget https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/finix/NFS-clang.sh
wget https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/finix/rm.sh

curl -s -X POST "$BOT_MSG_URL2/sendSticker" \
-d sticker="CAACAgUAAx0CXjGT1gACAeRg69dV3PYH_z8EZQnV9D9MubhVCwAClAAD7OCaHulbTgv4Q5nsIAQ" \
-d chat_id="$TG_CHAT_ID"
        
tg_post_msg "<b>Finix-kernel-(rosy):</b><code>Started build witch NFS GCC</code>"
echo "started build witch NFS GCC"
chmod +x NFS.sh
bash NFS.sh
echo "membersihkan config sebelumnya"
bash rm.sh
tg_post_msg "<b>NFSKernel-normal-(rosy):</b><code>Started build witch NeedForSpeed Clang</code>"
echo "Started build witch NeedForSpeed Clang"
chmod +x NFS-clang.sh
bash NFS-clang.sh
tg_post_msg "<b>NFSKernel-normal-(rosy):</b><code>Building completed...</code>"
curl -s -X POST "$BOT_MSG_URL2/sendSticker" \
-d sticker="CAACAgIAAx0CXjGT1gACAeVg69gXIw-a6h1nvmmaub51tQQwCgACLQMAAsbMYwIquW4nbs0crSAE" \
-d chat_id="$TG_CHAT_ID"
