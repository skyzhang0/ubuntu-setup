#! /bin/bash
# 编译安装 GMP

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 GMP 默认版本号
gmp_version="6.2.1"
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    gmp_version="$1"
fi

# 设置代理
source ../set_proxy.sh

# 安装依赖
sudo bash ./m4.sh

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
