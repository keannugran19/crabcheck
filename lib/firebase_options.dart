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
    apiKey: 'AIzaSyBlUkYyKAE5e4cSzEKOfvqCQ-7qkeq7fvE',
    appId: '1:819593173831:web:95d808519e9ec6e1514a62',
    messagingSenderId: '819593173831',
    projectId: 'crabcheck-c8aea',
    authDomain: 'crabcheck-c8aea.firebaseapp.com',
    storageBucket: 'crabcheck-c8aea.appspot.com',
    measurementId: 'G-T0JLWL3VV2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBC6-f6kBNUGEk2HhZRxseAdS2NT-_oJC4',
    appId: '1:819593173831:android:b8579b9daab693a2514a62',
    messagingSenderId: '819593173831',
    projectId: 'crabcheck-c8aea',
    storageBucket: 'crabcheck-c8aea.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDknBmmtW8dHpvp65RrwAiR0ehFRnV1-0o',
    appId: '1:819593173831:ios:976a06e1f58f025e514a62',
    messagingSenderId: '819593173831',
    projectId: 'crabcheck-c8aea',
    storageBucket: 'crabcheck-c8aea.appspot.com',
    iosBundleId: 'com.example.crabcheck',
  );
}