#! /bin/bash
# 通过编译安装更新某些工具

# 设置出错停止
set -e

cd ./update_tools.d

# 更新 cmake 到 3.21
bash ./cmake.sh 3.21.6

# 更新 gcc 到 11.2.0
bash ./gcc.sh 11.2.0

# 更新 python 到 3.9.13
bash ./cpython.sh 3.9.13

cd ..