# App icon assets

`Contents.json` references the full set of iOS icon sizes. Drop matching PNGs
here (no alpha channel — Apple rejects icons with transparency), or — strongly
recommended — generate them all from one 1024x1024 source with the
`flutter_launcher_icons` package:

```yaml
# add to pubspec.yaml dev_dependencies, then run:
#   dart run flutter_launcher_icons
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  ios: true
  image_path: "assets/icon/app_icon_1024.png"   # your 1024x1024 source
  remove_alpha_ios: true
```

Required filenames if you add them manually:
Icon-App-20x20@1x/2x/3x, Icon-App-29x29@1x/2x/3x, Icon-App-40x40@1x/2x/3x,
Icon-App-60x60@2x/3x, Icon-App-76x76@1x/2x, Icon-App-83.5x83.5@2x,
Icon-App-1024x1024@1x.

Until you add real icons the app still builds; Xcode will warn about missing
icon files and App Store Connect will require the 1024x1024 marketing icon
before you can submit.
