FDEVICE="salaa"
#set -o xtrace

fox_get_target_device() {

local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)

   if [ -n "$chkdev" ]; then

      FOX_BUILD_DEVICE="$FDEVICE"

   else

      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)

      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"

   fi

}


if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then

   fox_get_target_device

fi


if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
        export FOX_TARGET_DEVICES="salaa"
	export TARGET_DEVICE_ALT="RMX2151L1,RMX2153L1,RMX2155L1,RMX2156L1,RMX2161L1,RMX2163L1"

	# Initial Exports
	export ALLOW_MISSING_DEPENDENCIES=true
        export LC_ALL="C"

	# Maintaining Info
	export OF_MAINTAINER=Luks
        export FOX_MAINTAINER_PATCH_VERSION=$(date +"%Y%m%d")
        export FOX_BUILD_TYPE="Stable"

        # Custom pic for the maintainer's info in about section
	export OF_MAINTAINER_AVATAR=0

	# Device Variant
	export FOX_ARCH=arm64
	export FOX_VARIANT="RUI_V3.0"

	# Funtions
        export OF_ENABLE_LPTOOLS=1
        export OF_ADVANCED_SECURITY=1
	export FOX_REPLACE_TOOLBOX_GETPROP=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_GREP_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
        export OF_CHECK_OVERWRITE_ATTEMPTS=1
        export OF_USE_MAGISKBOOT=1
        export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
        export OF_FLASHLIGHT_ENABLE=0
        export OF_FL_PATH1="/tmp/flashlight"
        export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=0
        export FOX_BASH_TO_SYSTEM_BIN=1
        export FOX_USE_UPDATED_MAGISKBOOT=1
        export OF_FORCE_DATA_FORMAT_F2FS=1
        export FOX_MOVE_MAGISK_INSTALLER_TO_RAMDISK=1
        export OF_FORCE_CASEFOLDING=1
        export FOX_USE_PATCHELF_BINARY=1
        export FOX_EXCLUDE_ZIP=1

	# Display Settings
	export OF_SCREEN_H=2400
	export OF_STATUS_H=115
	export OF_STATUS_INDENT_LEFT=155
	export OF_STATUS_INDENT_RIGHT=46
	export OF_HIDE_NOTCH=1
	export OF_ALLOW_DISABLE_NAVBAR=0
        export OF_USE_GREEN_LED=0
        export TW_DEFAULT_LANGUAGE="en"
        export OF_DEFAULT_TIMEZONE="SAUST-3;SAUDT"

        # Splash image size (max 130 KB)
        export OF_SPLASH_MAX_SIZE=130

	# Other OrangeFox Vars
        export FOX_REMOVE_BUSYBOX_BINARY=1
        export FOX_DELETE_AROMAFM=1
        export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
        export OF_DEFAULT_KEYMASTER_VERSION=4.0
        export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1
        export OF_TWRP_COMPATIBILITY_MODE=1
        export OF_DISABLE_DM_VERITY_FORCED_ENCRYPTION=0
        export OF_FORCE_DISABLE_DM_VERITY_FORCED_ENCRYPTION=0
        export OF_SKIP_DECRYPTED_ADOPTED_STORAGE=1
        export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=0
	export OF_FIX_DECRYPTION_ON_DATA_MEDIA=1
	export OF_PATCH_AVB20=1
        export OF_SUPPORT_OZIP_DECRYPTION=1
        export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
        export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"  # Sun 21 Mar 04:26:40 GMT 2021
        export FOX_ENABLE_APP_MANAGER=1
        export FOX_USE_SPECIFIC_MAGISK_ZIP="/home/luks/fox_12.1/device/realme/salaa/Magisk/Magisk-v29.0.zip"
        export OF_QUICK_BACKUP_LIST="/boot;/dtbo;/recovery;/nvram;/tee2;/nvdata;/protect_f;/protect_s/"

        # OTA
	export OF_KEEP_DM_VERITY=0
	export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
	export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=0
	export OF_DISABLE_MIUI_OTA_BY_DEFAULT=0
        export OF_NO_MIUI_PATCH_WARNING=0

	# let's see what are our build VARs

	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
		export | grep "FOX" >> $FOX_BUILD_LOG_FILE
		export | grep "OF_" >> $FOX_BUILD_LOG_FILE
		export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
		export | grep "TW_" >> $FOX_BUILD_LOG_FILE

	fi

fi

#
