// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBBU2dFX4TomhQGudY0BCWvpnQo1zmiads',
    appId: '1:223459600533:web:bbcd53d2603c3f431f139c',
    messagingSenderId: '223459600533',
    projectId: 'routeviewer-eacdc',
    authDomain: 'routeviewer-eacdc.firebaseapp.com',
    storageBucket: 'routeviewer-eacdc.appspot.com',
    measurementId: 'G-RK5SGSFYBV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAD_7fL1mvqtZ4A2H0QcHRdbE0LyAINJH8',
    appId: '1:223459600533:android:5a177808ebcd79781f139c',
    messagingSenderId: '223459600533',
    projectId: 'routeviewer-eacdc',
    storageBucket: 'routeviewer-eacdc.appspot.com',
  );
}