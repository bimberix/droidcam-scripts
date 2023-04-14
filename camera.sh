#!/usr/bin/env bash

set -e

function retry(){
    local test_command="${1}"
    local run_command="${2}"
    local max_attempts=${3:-3}
    local attempt=0

    while ((attempt < max_attempts)) && ! eval "${test_command}"; do
        eval "${run_command}"
        ((attempt++))
    done
}

export ANDROID_SERIAL=

adb wait-for-device

adb shell input keyevent KEYCODE_POWER && sleep 1
adb shell input keyevent KEYCODE_WAKEUP && sleep 1
adb shell input text 0000
adb shell monkey -p com.dev47apps.droidcamx -c android.intent.category.LAUNCHER 1

retry "adb shell pidof com.dev47apps.droidcamx" "sleep 1" && sleep 5

droidcam-cli -v adb 4747
