ARCHS = arm64 arm64e
TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = StockChecker

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = StockChecker

StockChecker_FILES = $(wildcard src/*.m)
StockChecker_FRAMEWORKS = UIKit CoreGraphics Foundation
StockChecker_CFLAGS = -fobjc-arc -O3

include $(THEOS_MAKE_PATH)/application.mk
