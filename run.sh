#! /bin/bash
# 用于 一键 完全配置 ubuntu 系统
# 适用于 ubuntu 20.04 LTS

# 设置出错停止
set -e

# 检测是否有 root 权限
if [[ "$UID" -ne '0' ]]; then
    echo "Not running with root, exiting..."
    exit 1
fi

bash system.sh
bash apt.sh
bash install.sh
bash update.sh