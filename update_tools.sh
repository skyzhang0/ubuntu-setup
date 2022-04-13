#! /bin/bash
# 通过编译安装更新某些工具

# 设置出错停止
set -e

cd ./update_tools.d

# 更新 cmake 到 3.21
bash ./cmake_3.21.6.sh

# 更新 gcc 到 11.2.0
bash ./gcc_11.2.0.sh

cd ..