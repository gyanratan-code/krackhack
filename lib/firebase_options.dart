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
    apiKey: 'AIzaSyCbT9AAHzX5jUjdn9n4EodS6vZIYobdlqs',
    appId: '1:311616847751:web:313cb39493505887819d22',
    messagingSenderId: '311616847751',
    projectId: 'krackhack-46be9',
    authDomain: 'krackhack-46be9.firebaseapp.com',
    storageBucket: 'krackhack-46be9.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD1eou1l8EQS5RlyRPH0e8jiEdhzEDSs8M',
    appId: '1:311616847751:android:014719de9f2f343d819d22',
    messagingSenderId: '311616847751',
    projectId: 'krackhack-46be9',
    storageBucket: 'krackhack-46be9.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDK9Xxh9DxJzY8UaGjbWnxYoSFFVqjOPls',
    appId: '1:311616847751:ios:8e261fe3d744099c819d22',
    messagingSenderId: '311616847751',
    projectId: 'krackhack-46be9',
    storageBucket: 'krackhack-46be9.firebasestorage.app',
    iosBundleId: 'com.example.iitMarketing',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDK9Xxh9DxJzY8UaGjbWnxYoSFFVqjOPls',
    appId: '1:311616847751:ios:8e261fe3d744099c819d22',
    messagingSenderId: '311616847751',
    projectId: 'krackhack-46be9',
    storageBucket: 'krackhack-46be9.firebasestorage.app',
    iosBundleId: 'com.example.iitMarketing',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCbT9AAHzX5jUjdn9n4EodS6vZIYobdlqs',
    appId: '1:311616847751:web:9474810d59bbdb2a819d22',
    messagingSenderId: '311616847751',
    projectId: 'krackhack-46be9',
    authDomain: 'krackhack-46be9.firebaseapp.com',
    storageBucket: 'krackhack-46be9.firebasestorage.app',
  );
}
