#!/bin/sh
# set -x #echo on
scutil --get ComputerName | sed 's/^/Computer Name: /'
pod --version | sed 's/^/Cocoapods /'
dart --version | cut -c1-24
flutter --version | head -n 1 | cut -c1-15
sw_vers | head -n 2 | tail -n 1 | cut -c18-30 | sed 's/^/MacOS /'
ruby --version | head -n 1  | cut -c1-15
xcodebuild -version | head -n 1 | cut -c1-20
