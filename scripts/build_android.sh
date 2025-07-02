#!/bin/bash
set -e
echo "[BUILD] Starting AOSP Build..."
source build/envsetup.sh
lunch aosp_device-userdebug
make -j$(nproc)
echo "[BUILD] Completed."
