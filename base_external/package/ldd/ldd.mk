##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 'main'
LDD_SITE = 'git@github.com:rtsetiabekti/aeld-assignment-7.git'
LDD_SITE_METHOD = git

$(eval $(kernel-module))

define LDD_BUILD_CMDS
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/scull LDDINC=$(@D)/include modules $(LINUX_MAKE_FLAGS)
	$(MAKE) -C $(LINUX_DIR) M=$(@D)/misc-modules LDDINC=$(@D)/include modules $(LINUX_MAKE_FLAGS)
endef

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra
	$(INSTALL) -m 0644 $(@D)/scull/scull.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
	$(INSTALL) -m 0644 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
	$(INSTALL) -m 0644 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/extra/
endef

$(eval $(generic-package))
