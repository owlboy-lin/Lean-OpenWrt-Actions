#!/bin/bash

# 修改默认ip
# sed -i 's/192.168.1.1/10.10.20.20/g' package/base-files/files/bin/config_generate

# 添加额外的插件和主题
# cd package
# mkdir openwrt-packages
# cd openwrt-packages

# ssr包下载
# git clone --depth 1 https://github.com/fw876/helloworld.git
# git clone --depth 1 https://github.com/kenzok8/openwrt-packages.git

# git clone --depth 1 https://github.com/kenzok8/small-package.git

sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default