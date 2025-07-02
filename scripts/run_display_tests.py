import subprocess

def test_brightness():
    output = subprocess.getoutput("adb shell settings get system screen_brightness")
    assert int(output) >= 0 and int(output) <= 255, "Brightness out of range"

def test_rotation():
    subprocess.call("adb shell content insert --uri content://settings/system --bind name:s:accelerometer_rotation --bind value:i:1", shell=True)
    output = subprocess.getoutput("adb shell settings get system accelerometer_rotation")
    assert output.strip() == "1", "Rotation not enabled"

if __name__ == "__main__":
    test_brightness()
    test_rotation()
    print("[DISPLAY] All tests passed.")
