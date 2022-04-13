#! /bin/bash
# nodejs, npm

# 设置出错停止
set -e

nvm install 11
nvm install 12
nvm install 15
nvm install 16
nvm install 17
nvm install node
nvm use node

# npm
npm install -g cnpm --registry=https://registry.npmmirror.com
npm install -g nrm
nrm use taobao
npm install -g yarn
npm install -g yrm
yrm use taobao