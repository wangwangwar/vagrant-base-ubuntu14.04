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
