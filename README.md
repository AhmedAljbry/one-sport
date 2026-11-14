# OneSport

A Flutter sports application that loads event and category data through Bloc/Cubit state and integrates Firebase services. The repository also contains video player screens and TV channel views. It belongs to a wider collection of repositories that includes an [administration dashboard](https://github.com/AhmedAljbry/dasbord-onesport) and a separate [OneTV player](https://github.com/AhmedAljbry/one-tv).

![OneSport app preview](Gemini_Generated_Image_smnfu1smnfu1smnf.png)

## Technology

- Flutter and Dart.
- Bloc/Cubit and Get packages for application state and navigation.
- Firebase Core, Authentication, Cloud Firestore, and Cloud Messaging packages.
- Video playback packages including `video_player`, `chewie`, and `pod_player`.

## Run locally

Install Flutter with Dart 3.2.3 or newer, configure a Firebase project for the intended app identifiers, then run:

```sh
flutter pub get
flutter run
```

Project checks:

```sh
flutter analyze
flutter test
```

The current widget test is the generated counter sample and does not test OneSport behavior. Replace it with focused tests before enabling a required CI test gate. Flutter SDK was unavailable in the audit environment, so the application could not be built or analyzed locally.

## Configuration and security

Firebase client configuration is public application metadata; it does not grant server-side privileges by itself. Protect project data with Firebase Authentication, restrictive Firestore Security Rules, and API-key restrictions. Keep service-account files, signing credentials, and server tokens out of source control. Review the Firestore and API rules for every collection and stream endpoint before release.

The repository contains an API-style Firebase client key in application source and Firebase client configuration. Client keys are visible in distributed apps, but their Google API restrictions and Firebase rules should be reviewed. Rotate or restrict credentials if they grant broader access than intended.

## Scope and release checks

This repository presents the Flutter client portion of the OneSport suite. Availability of backend endpoints, authentication policy, stream authorization, content rights, and production notification setup must be verified separately. Do not describe stream links as secure unless the server enforces authorization and expiration.
