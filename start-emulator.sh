#! /bin/sh
echo "Starting emulator for Android-Linux-Ready..."

SDCARD=sdcard.img

# Set the EMULATOR variable with the correct path if the emalator is not availble in $PATH
# EMULATOR=~/android-sdk/tools/emulator
#EMULATOR=`which emulator`
EMULATOR=/Users/robgas/Development/android-sdk-mac_x86/tools/emulator
if [ -z $EMULATOR ]
then
	echo "Please set the EMULATOR variable."
	exit
fi

echo "Using $EMULATOR..."


if [ ! -e $SDCARD ]
then
	echo "Sdcard image not found: creating..."
	`dirname $EMULATOR`/mksdcard 512M $SDCARD
	echo "Done"
fi	
	
$EMULATOR \
-verbose \
-system system.img \
-kernel zImage \
-ramdisk ramdisk.img \
-data userdata.img \
-sdcard sdcard.img \
-skindir . -skin WVGA800 \
-memory 256 \
-show-kernel \
-shell \
-no-snapshot 
