rm pubspec.lock
rm ios/Podfile.lock
rm -rf ios/Pods
rm -rf ios/.symlinks
flutter clean
#flutter pub upgrade --major-versions
flutter pub get
#rm ios/Podfile # this line removes podfile which mustn't be removed and if we want to change it we should do it with care
#rm -rf ios/Pods ios/Runner.xcworkspace
cd ios || exit
pod repo update
pod install --repo-update
cd ..
# by removing "pubspec.lock" we don't need this line and this line might even cause downgrade (Major versions)
