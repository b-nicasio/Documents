#!/bin/bash

# TODO
# Convert this script to a LaunchAgent

while true
do
        cd ~/Library/Developer/Xcode/Archives
        sudo rm -rfv * || true

        cd ~/Library/Developer/Xcode/iOS\ DeviceSupport/
        sudo rm -rfv * || true

        cd /Users/gbh/Library/Developer/Xcode/Archives
        sudo rm -rfv * || true

        sleep 1296000
done