#! /bin/bash
# 通过编译安装更新某些工具

set -e # 设置出错停止
set -x # 设置输出执行的命令

cd ./update_tools.d

# 更新 cmake
bash ./cmake.sh

# 更新 gcc
bash ./gcc.sh

# 更新 python
bash ./cpython.sh

cd ..