#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.10.10.10/g' package/base-files/files/bin/config_generate

# Enable Cache
echo -e 'CONFIG_DEVEL=y\nCONFIG_CCACHE=y' >> .config

# design修改proxy链接
sed -i -r "s#navbar_proxy = 'openclash'#navbar_proxy = 'passwall'#g" feeds/luci/themes/luci-theme-design/luasrc/view/themes/design/header.htm
add luci-app-autotimeset
git clone https://github.com/sirpdboy/luci-app-autotimeset.git package/luci-app-autotimeset
git clone https://github.com/selfcan/luci-app-fileassistant.git package/luci-app-fileassistant
git clone https://github.com/selfcan/luci-app-parentcontrol.git package/luci-app-parentcontrol
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> "feeds.conf.default"
echo "src-git small https://github.com/kenzok8/small" >> "feeds.conf.default"
./scripts/feeds update -a
./scripts/feeds install -a
