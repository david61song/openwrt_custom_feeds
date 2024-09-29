#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ultari
PKG_VERSION:=1.0.5
PKG_RELEASE:=1


PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/david61song/nodogsplash-up.git
PKG_SOURCE_VERSION:=main
PKG_MIRROR_HASH:=skip


PKG_FIXUP:=autoreconf
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/ultari
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  DEPENDS:=+libpthread +libmicrohttpd-no-ssl +iptables-nft \
           +iptables-mod-nat-extra +iptables-mod-ipopt \
           +iptables-mod-conntrack-extra +libcurl
  TITLE:=Captive portal for Sangmyung University
  URL:=https://github.com/david61song/ultari-new.git
endef

define Package/ultari/description
  Ultari is a Captive Portal that offers a way to
  provide restricted access to the Internet by showing a smul login
  page to the user before Internet access is granted.

  Customized for sangmyung university login.
endef

define Package/ultari/install
	$(INSTALL_DIR) $(1)/usr/lib/ultari
	$(INSTALL_BIN) ./files/usr/lib/ultari/restart.sh $(1)/usr/lib/ultari/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ultari $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ultarictl $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/ultari/htdocs/

	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/404.html $(1)/etc/ultari/htdocs/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/splash.html $(1)/etc/ultari/htdocs/
	$(INSTALL_DIR) $(1)/etc/ultari/htdocs/css
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/css/login.css $(1)/etc/ultari/htdocs/css/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/css/background.jpg $(1)/etc/ultari/htdocs/css/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/css/login.css.test $(1)/etc/ultari/htdocs/css/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/css/style.css $(1)/etc/ultari/htdocs/css/
	$(INSTALL_DIR) $(1)/etc/ultari/htdocs/error
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/error/fail_invalid_input.html $(1)/etc/ultari/htdocs/error/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/error/fail_jwt.html $(1)/etc/ultari/htdocs/error/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/error/fail_unexpect.html $(1)/etc/ultari/htdocs/error/
	$(INSTALL_DIR) $(1)/etc/ultari/htdocs/js
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/js/helper.js $(1)/etc/ultari/htdocs/js/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/resources/web_root/js/login.js $(1)/etc/ultari/htdocs/js/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/auth_curl $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/resources/pas_auth.sh $(1)/usr/bin/pas_auth.sh


	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/ultari $(1)/etc/config/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/ultari $(1)/etc/init.d/
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/etc/uci-defaults/40_ultari $(1)/etc/uci-defaults/
endef

define Package/ultari/postrm
#!/bin/sh
uci delete firewall.ultari
uci commit firewall
endef

define Package/ultari/conffiles
/etc/config/ultari
endef

$(eval $(call BuildPackage,ultari))
