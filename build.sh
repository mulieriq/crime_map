#!/bin/sh
echo "Flutter Clean Running ....>>>>>"
flutter clean
echo "Building For [android-arm,android-arm64,android-x64] ....>>>>>"
flutter build apk --target-platform android-arm,android-arm64,android-x64 --split-per-abi
exit
#echo "Building App Bundle ....>>>>>"
# flutter build appbundle --target-platform android-arm,android-arm64,android-x64
exit