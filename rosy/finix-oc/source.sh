#!/usr/bin/env bash

export USE_CCACHE=1
export CCACHE_DIR="$HOME/.ccache"
export TZ=Asia/Jakarta
export LOCALVERSION=-Gaming-Mode🔥
export KERNEL_SOURCE=https://github.com/AnGgIt88/Finix_kernel-4.9-rosy
export KERNEL_BRANCH=a11/overclock
export DEVICE_CODENAME=rosy
export DEVICE_DEFCONFIG=rosy-perf_defconfig
export ANYKERNEL=https://github.com/AnGgIt86/AnyKernel3
export TG_TOKEN=1852697615:AAGKDF9cYNnTY4Ylm7XjBrsssS31eTtqYfk
export TG_CHAT_ID=-1001580307414
export BUILD_USER=xiaomi
export BUILD_HOST=nfs-projects
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
export BOT_MSG_URL2="https://api.telegram.org/bot$TG_TOKEN"
git config --global user.email "jarbull87@gmail.com"
git config --global user.name "AnGgIt88"

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

wget https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/finix-oc/NFS.sh
wget https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/finix-oc/NFS-clang.sh
wget https://raw.githubusercontent.com/AnGgIt86/NFSKernel-interface/main/rosy/finix-oc/rm.sh

curl -s -X POST "$BOT_MSG_URL2/sendSticker" \
-d sticker="CAACAgUAAx0CXjGT1gACAeRg69dV3PYH_z8EZQnV9D9MubhVCwAClAAD7OCaHulbTgv4Q5nsIAQ" \
-d chat_id="$TG_CHAT_ID"
        
chmod +x NFS.sh
bash NFS.sh
bash rm.sh
chmod +x NFS-clang.sh
bash NFS-clang.sh
curl -s -X POST "$BOT_MSG_URL2/sendSticker" \
-d sticker="CAACAgIAAx0CXjGT1gACAeVg69gXIw-a6h1nvmmaub51tQQwCgACLQMAAsbMYwIquW4nbs0crSAE" \
-d chat_id="$TG_CHAT_ID"
