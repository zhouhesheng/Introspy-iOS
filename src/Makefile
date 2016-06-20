THEOS_DEVICE_IP = 10.10.0.170
TARGET = iPhone:9.3:7.0
ARCHS =  armv7 arm64

include theos/makefiles/common.mk

# Xcode 5 got rid of GCC and forces the use of Clang
# Clang complains about unused arguments
# Most likely a bug in Theos, silence these warnings for now
ADDITIONAL_CCFLAGS  = -Qunused-arguments

TWEAK_NAME = introspy
introspy_FILES = Tweak.xmi \
CallTracer.m \
hooks/CommonDigestHooks.m \
hooks/LibCHooks.m \
hooks/KeychainHooks.m \
hooks/DelegateProxies.m \
PlistObjectConverter.m \
hooks/CommonKeyDerivationHooks.m \
CallStackInspector.m \
SQLiteStorage.m \
hooks/SecurityHooks.m \
hooks/CommonCryptorHooks.m \
hooks/CommonHMACHooks.m \
NSLogger/LoggerClient.m

introspy_LIBRARIES = sqlite3 substrate
introspy_FRAMEWORKS = UIKit, Foundation, Security, CFNetwork, SystemConfiguration
include $(THEOS_MAKE_PATH)/tweak.mk
