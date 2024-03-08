TARGET := iphone:clang:14.5:14.0
ARCHS := arm64
FINALPACKAGE := 1
INSTALL_TARGET_PROCESSES = YouTube
PACKAGE_VERSION = 03.07.2024-1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTLitePlus

EXTRA_CFLAGS := $(addprefix -I,$(shell find Tweaks/FLEX -name '*.h' -exec dirname {} \;))

YTLitePlus_FILES = YTLitePlus.xm $(shell find Source -name '*.xm' -o -name '*.x' -o -name '*.m') $(shell find Tweaks/FLEX -type f \( -iname \*.c -o -iname \*.m -o -iname \*.mm \))
YTLitePlus_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unsupported-availability-guard -DTWEAK_VERSION=$(PACKAGE_VERSION) $(EXTRA_CFLAGS)
YTLitePlus_FRAMEWORKS = UIKit Security

include $(THEOS_MAKE_PATH)/tweak.mk
