#! /bin/bash
# 编译安装 GMP

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 GMP 版本号，如果要安装其他版本仅需修改此变量
gmp_version="6.2.1"

# 设置代理
source ../set_proxy.sh

# 安装依赖
sudo bash ./m4_1.4.19.sh

[ -f gmp-${gmp_version}.tar.xz ] && rm gmp-${gmp_version}.tar.xz
[ -d gmp-${gmp_version} ] && rm -r gmp-${gmp_version}

# wget https://mirrors.cloud.tencent.com/gnu/gmp/gmp-6.2.1.tar.xz
wget https://mirrors.cloud.tencent.com/gnu/gmp/gmp-${gmp_version}.tar.xz
# tar -xf gmp-6.2.1.tar.xz
tar -xf gmp-${gmp_version}.tar.xz
cd gmp-${gmp_version}
./configure
make -j 6
sudo make install
cd ..

[ -f gmp-${gmp_version}.tar.xz ] && rm gmp-${gmp_version}.tar.xz
[ -d gmp-${gmp_version} ] && rm -r gmp-${gmp_version}
