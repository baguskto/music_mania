# Music Mania

## Description

This repository is source code of music mania player, build with flutter framework on GetX with api
from itunes.

## Requirement Device

- Operation System : Windows/Mac/Linux
- Flutter : 2.10.5
- Dart : 2.16.2
- Mobile Device : Pixel 3a
- Mobile Operation System : Android
- Android SDK Version : 32.0.0

## Support Features

- Search music by artist
- Play music by search
- Pause music
- Resume music
- Previous music
- Next music

## Next Support Features

- Slide music player to stop music
- Slide saved music to remove it

## Run project

- Run command

```bash
flutter pub get
flutter run
```

## Build app

- Run command

```bash
# Android
flutter pub get
flutter build apk --release
```

```bash
# Ios
flutter pub get
flutter build ios --release
```

## Deploy App

- Generate keystore

```bash
# Linux
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

# Windows
keytool -genkey -v -keystore c:\Users\USER_NAME\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

- Reference the keystore

```properties
storePassword=<password from previous step>
keyPassword=<password from previous step>
keyAlias=upload
storeFile=<location of the key store file, such as /Users/<user name>/upload-keystore.jks>
```

- Configure signing
  in [grandle](https://docs.flutter.dev/deployment/android#configure-signing-in-gradle)
- Build appbundle

```bash
flutter run appbundle --release
```

- Upload appbundle
  to [Google Play Console](https://developer.android.com/studio/publish/upload-bundle)

