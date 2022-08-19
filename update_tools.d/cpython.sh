#! /bin/bash
# 编译安装 python 最新版本

# 设置代理
source ../set_proxy.sh

# 设置 CMake 版本号，如果要安装其他版本仅需修改此变量
python_version="3.9.13"
if [ $# -ge 1 ]; then # 若有参数则把第一个作为版本号
    python_version="$1"
fi

set -e # 设置出错停止
set -x # 设置输出执行的命令

# 安装依赖
apt install -y libgdbm-dev
apt install -y readline-common readline-doc libreadline-dev

[ -d ./cpython/ ] && rm -r ./cpython/

git clone https://gitee.com/mirrors/cpython.git cpython

cd cpython
# git checkout vx.x.x
git checkout v${python_version}
./configure --enable-optimizations
make -j 8
sudo make install
cd ..

[ -d cpython ] && rm -r cpython
