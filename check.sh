#!/bin/bash

# 获取 npm 源
npm_source=$(npm config get registry)
echo "当前 npm 源是: $npm_source"

# 获取 apt 源（仅适用于 Debian/Ubuntu 系统）
if command -v apt &> /dev/null; then
    echo "当前 apt 源是:"
    grep -E '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/*
else
    echo "apt 未安装或不是 Debian/Ubuntu 系统"
fi

# 获取 yum 源（仅适用于 CentOS/RHEL 系统）
if command -v yum &> /dev/null; then
    echo "当前 yum 源是:"
    yum repolist
else
    echo "yum 未安装或不是 CentOS/RHEL 系统"
fi

# 获取 pip 源（Python 包管理器）
pip_source=$(pip config get global.index-url)
echo "当前 pip 源是: $pip_source"

# 获取 gem 源（Ruby 包管理器）
gem_source=$(gem sources -l)
echo "当前 gem 源是: $gem_source"

exit 0