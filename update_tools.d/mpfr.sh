#! /bin/bash
# 编译安装 MPFR

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 设置 MPFR 默认版本号
mpfr_version="4.1.0"
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    mpfr_version="$1"
fi

# 设置代理
source ../set_proxy.sh

[ -f mpfr-${mpfr_version}.tar.xz ] && rm mpfr-${mpfr_version}.tar.xz
[ -d mpfr-${mpfr_version} ] && rm -r mpfr-${mpfr_version}

# wget https://mirrors.cloud.tencent.com/gnu/mpfr/mpfr-4.1.0.tar.xz
wget https://mirrors.cloud.tencent.com/gnu/mpfr/mpfr-${mpfr_version}.tar.xz
# tar -xf mpfr-4.1.0.tar.xz
tar -xf mpfr-${mpfr_version}.tar.xz
cd mpfr-${mpfr_version}
./configure
make -j 6
sudo make install 
cd ..

[ -f mpfr-${mpfr_version}.tar.xz ] && rm mpfr-${mpfr_version}.tar.xz
[ -d mpfr-${mpfr_version} ] && rm -r mpfr-${mpfr_version}
