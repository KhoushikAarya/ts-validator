#!/bin/bash
DEVICE=$1
mkdir -p logs
adb -s $DEVICE logcat -d > logs/logcat.txt
adb -s $DEVICE shell dumpsys > logs/dumpsys.txt
adb -s $DEVICE bugreport > logs/bugreport.txt
