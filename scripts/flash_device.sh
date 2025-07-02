#!/bin/bash
DEVICE=$1
adb -s $DEVICE reboot bootloader
fastboot -s $DEVICE flash boot out/boot.img
fastboot -s $DEVICE flash system out/system.img
fastboot -s $DEVICE flash vendor out/vendor.img
fastboot -s $DEVICE reboot
adb -s $DEVICE wait-for-device
