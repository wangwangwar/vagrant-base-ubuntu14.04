#!/usr/bin/env bash

echo ""
echo "Update apt source"
echo ""
mv /etc/apt/{sources.list,sources.list.bak}
cat >> /etc/apt/sources.list <<EOF
deb http://mirrors.aliyun.com/debian/ wheezy main non-free contrib
deb http://mirrors.aliyun.com/debian/ wheezy-proposed-updates main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ wheezy main non-free contrib
deb-src http://mirrors.aliyun.com/debian/ wheezy-proposed-updates main non-free contrib
EOF

echo ""
echo "aptitude update"
echo ""
aptitude update

echo ""
echo "Linux utils"
echo ""
aptitude install -y linux-headers-$(uname -r) build-essentials git
aptitude install -y libxml2-dev libxslt-dev curl libcurl4-openssl-dev
aptitude install -y libreadline-dev

echo ""
echo "Programming utils"
echo ""
aptitude install -y vim emacs

echo ""
echo "aptitude cleanup"
echo ""
aptitude clean

echo ""
echo "Set locale"
echo ""
cat >> /etc/locale.gen <<EOF
zh_CN.UTF-8 UTF-8
EOF
locale-gen
