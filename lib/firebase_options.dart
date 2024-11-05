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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDykO4c51-9pRn9whfXzFp01oYRfbs861Y',
    appId: '1:5114094801:web:19bab42f72e694dbc1d1f0',
    messagingSenderId: '5114094801',
    projectId: 'qbank-6be19',
    authDomain: 'qbank-6be19.firebaseapp.com',
    storageBucket: 'qbank-6be19.firebasestorage.app',
    measurementId: 'G-G2LMY9YS3Y',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCGnlBqLQUw8ExKQe-WLEbPjayeSh4HWU',
    appId: '1:5114094801:android:26e159665e9961edc1d1f0',
    messagingSenderId: '5114094801',
    projectId: 'qbank-6be19',
    storageBucket: 'qbank-6be19.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBDi673qwrWI33dgRDGJ20OLT04PrNC13Y',
    appId: '1:5114094801:ios:365677dd0804a6c9c1d1f0',
    messagingSenderId: '5114094801',
    projectId: 'qbank-6be19',
    storageBucket: 'qbank-6be19.firebasestorage.app',
    iosBundleId: 'com.example.ossQbank',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBDi673qwrWI33dgRDGJ20OLT04PrNC13Y',
    appId: '1:5114094801:ios:365677dd0804a6c9c1d1f0',
    messagingSenderId: '5114094801',
    projectId: 'qbank-6be19',
    storageBucket: 'qbank-6be19.firebasestorage.app',
    iosBundleId: 'com.example.ossQbank',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDykO4c51-9pRn9whfXzFp01oYRfbs861Y',
    appId: '1:5114094801:web:40f575d51d5b8ad6c1d1f0',
    messagingSenderId: '5114094801',
    projectId: 'qbank-6be19',
    authDomain: 'qbank-6be19.firebaseapp.com',
    storageBucket: 'qbank-6be19.firebasestorage.app',
    measurementId: 'G-MDBMTMSXWP',
  );
}
