# iOS Setup & App Store Submission Guide

This document covers everything to take `ai_life_navigator` from source to a
TestFlight / App Store build. The `ios/` folder is fully configured; the steps
below are the parts that **must** happen on a Mac with Xcode — they cannot be
done from the Flutter source alone.

---

## 0. What's already configured for you

- `ios/Runner/Info.plist` — display name "AI Life Navigator", portrait lock,
  iPad full-screen, ATS secure defaults, **no false permission declarations**
- `ios/Runner.xcodeproj/project.pbxproj` — bundle id `com.ailifenavigator.app`,
  iOS 13.0 deployment target, universal (iPhone + iPad), Swift 5
- `ios/Podfile` — CocoaPods with iOS 13 target and post-install hardening
- `ios/Runner/AppDelegate.swift`, bridging header, asset catalogs, launch +
  main storyboards, build scheme for archive

---

## 1. Prerequisites (Mac only)

- macOS + Xcode 15 or newer
- CocoaPods: `sudo gem install cocoapods`
- An Apple Developer Program membership ($99/year) — required to sign,
  archive, and upload
- Flutter SDK installed and on PATH

---

## 2. First build

```bash
# from the project root
flutter pub get                 # regenerates ios/Flutter/Generated.xcconfig + GeneratedPluginRegistrant
cd ios
pod install                     # resolves native pods (path_provider, shared_preferences, sqflite)
cd ..
flutter build ios --release     # sanity build (unsigned)
```

If anything in the hand-written Xcode project ever looks off, you can
regenerate a clean iOS shell and re-apply config:

```bash
flutter create --platforms=ios .
```

Then re-apply: bundle id, display name, the privacy-description comments, and
`UIRequiresFullScreen` from this repo's `Info.plist`.

---

## 3. Signing & identifiers (Xcode)

1. Open **`ios/Runner.xcworkspace`** (NOT the .xcodeproj — the workspace
   includes Pods).
2. Select the **Runner** target → **Signing & Capabilities**.
3. Set your **Team** and confirm the **Bundle Identifier**
   (`com.ailifenavigator.app` — change it to your own reverse-domain id).
4. Let Xcode "Automatically manage signing" create the provisioning profile.

---

## 4. App icons & launch image

- Drop a 1024x1024 PNG (no alpha) and generate all sizes with
  `flutter_launcher_icons` (see `ios/Runner/Assets.xcassets/AppIcon.appiconset/README.md`).
- The launch screen centers `LaunchImage` on white; replace the PNGs in
  `LaunchImage.imageset/` or edit `Base.lproj/LaunchScreen.storyboard`.
- App Store Connect requires the 1024x1024 marketing icon before submission.

---

## 5. App Store privacy ("nutrition label")

In App Store Connect → your app → **App Privacy**, declare what you collect.
As the app stands today it stores everything **locally on device** (Hive +
SharedPreferences) and collects nothing server-side, so you can truthfully
answer "Data Not Collected" — **unless/until** you wire a real backend, auth,
analytics, or the AI service to a network API. If you do, update this section
honestly; mismatches here are a common rejection/removal reason.

---

## 6. Features that are UI-only today (do NOT enable their iOS config yet)

Enabling native config for a feature you haven't implemented gets you rejected
under Guideline 2.1 / 5.1.1. Turn these on only when the Dart code actually uses
them:

| Feature in UI | Status | What to add when you implement it |
|---|---|---|
| Permission screen (notif/location/storage) | UI only | `permission_handler` pod macros + the matching `NS*UsageDescription` keys in Info.plist (templates are commented in Info.plist) |
| Push notifications | UI only | Push Notifications capability + APNs key + `firebase_messaging` or native APNs; `remote-notification` background mode |
| Payment / subscription | UI only | `in_app_purchase` + StoreKit products in App Store Connect; **Apple requires IAP for digital goods (Guideline 3.1.1) — you cannot use Stripe/PayPal for in-app digital subscriptions** |
| Login / signup | Local only | A real auth backend; if you add third-party sign-in (Google/Facebook), Apple requires **Sign in with Apple** too (Guideline 4.8) |
| AI analysis | Stubbed | Real API; update App Privacy to declare data sent off-device |

---

## 7. Archive & upload

```bash
# Option A — command line
flutter build ipa --release
# then open build/ios/archive/Runner.xcarchive in Xcode Organizer → Distribute App

# Option B — Xcode
# Product ▸ Destination ▸ "Any iOS Device (arm64)"
# Product ▸ Archive ▸ Distribute App ▸ App Store Connect ▸ Upload
```

---

## 8. Pre-submission checklist (Apple review)

- [ ] Real app icon (1024 marketing + all sizes), no transparency
- [ ] Launch screen shows brand, not a blank/placeholder
- [ ] App Privacy answers match actual data behavior
- [ ] No unused permission strings in Info.plist
- [ ] No references to other platforms (e.g. "Android") in UI/copy
- [ ] Payment screens removed OR backed by real StoreKit IAP
- [ ] If third-party login exists, Sign in with Apple is offered
- [ ] Demo account credentials provided in App Review notes (the app's login is
      local; tell the reviewer any email/password works, or wire a test account)
- [ ] Support URL + marketing URL + privacy policy URL live and reachable
- [ ] Tested on a physical device and on the smallest supported screen
      (iPhone SE) and a notch/Dynamic Island device

---

## 9. Honest limitations of this conversion

What was done here is **source + configuration**. The following are genuinely
impossible without your Mac, Xcode, and Apple account, and no amount of file
editing substitutes for them:

- Actually compiling, running on a simulator/device, archiving, signing
- Verifying there are zero runtime crashes on iOS
- Generating certificates / provisioning profiles
- Producing real icon artwork
- Final visual QA on real hardware

Run section 2 first; if `flutter build ios --release` surfaces any error, paste
it back and it can be fixed precisely.
