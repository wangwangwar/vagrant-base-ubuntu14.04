#!/usr/bin/env bash

echo ""
echo "Update apt source"
echo ""
mv /etc/apt/{sources.list,sources.list.bak}
cat >> /etc/apt/sources.list <<EOF
  deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
    deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
      deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
        deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
          deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
            deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
              deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
                deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
                  deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
                    deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
EOF

echo ""
echo "aptitude update"
echo ""
aptitude update

echo ""
echo "Linux utils"
echo ""
aptitude install -y linux-headers-$(uname -r) build-essential git libxml2-dev libxslt-dev curl libcurl4-openssl-dev libreadline-dev

echo ""
echo "Chinese env"
echo ""
aptitude install -y fonts-wqy-microhei
locale-gen zh_CN.UTF-8
export LC_ALL="zh_CN.UTF-8"

echo ""
echo "Programming utils"
echo ""
aptitude install -y vim

echo ""
echo "aptitude cleanup"
echo ""
aptitude clean
