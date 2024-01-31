// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyADQ_zT3NCzUB5FYaZmrLYeADTdZINo_mA',
    appId: '1:361255402270:web:d1b8b6912301f16cbb670f',
    messagingSenderId: '361255402270',
    projectId: 'flutter-notification-6aeac',
    authDomain: 'flutter-notification-6aeac.firebaseapp.com',
    storageBucket: 'flutter-notification-6aeac.appspot.com',
    measurementId: 'G-FKNN020FVP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCssqhmPdw8Vt9Iondy70W-3dijQIX1qjE',
    appId: '1:361255402270:android:e568167f791c4a9ebb670f',
    messagingSenderId: '361255402270',
    projectId: 'flutter-notification-6aeac',
    storageBucket: 'flutter-notification-6aeac.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCqQbBHyvGI_BZLn-h3STM77HIDNIckptg',
    appId: '1:361255402270:ios:4b97a320c27bdf5fbb670f',
    messagingSenderId: '361255402270',
    projectId: 'flutter-notification-6aeac',
    storageBucket: 'flutter-notification-6aeac.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseNotification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCqQbBHyvGI_BZLn-h3STM77HIDNIckptg',
    appId: '1:361255402270:ios:4b97a320c27bdf5fbb670f',
    messagingSenderId: '361255402270',
    projectId: 'flutter-notification-6aeac',
    storageBucket: 'flutter-notification-6aeac.appspot.com',
    iosBundleId: 'com.example.flutterFirebaseNotification',
  );
}
