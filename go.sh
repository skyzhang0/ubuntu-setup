#! /bin/bash
#用于 一键 完全配置 ubuntu 系统

# 设置出错停止
set -e

if [[ "$UID" -ne '0' ]]; then
    echo "Not running with root, exiting..."
    exit 1
fi

bash setup_basic.sh
bash setup_env.sh
bash install_tools.sh
bash update_tools.sh