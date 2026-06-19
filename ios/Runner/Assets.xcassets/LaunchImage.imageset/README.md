# Launch image assets

This imageset needs three PNGs (transparent or your brand background):

- `LaunchImage.png` — 1x (e.g. 60x60)
- `LaunchImage@2x.png` — 2x (e.g. 120x120)
- `LaunchImage@3x.png` — 3x (e.g. 180x180)

The default Flutter template ships a tiny transparent placeholder. The launch
screen (`Base.lproj/LaunchScreen.storyboard`) centers this image on a white
background. You can replace the storyboard with your own brand splash, or just
drop branded PNGs here.

The fastest path: use a tool like https://appicon.co or the
`flutter_launcher_icons` / `flutter_native_splash` packages to generate every
size from one source image (see ios/IOS_SETUP.md).
