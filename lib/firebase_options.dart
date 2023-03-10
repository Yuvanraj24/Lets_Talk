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
    apiKey: 'AIzaSyDNKvS2vV3TJHiIDU4kXnT9jh98oUJ_2KE',
    appId: '1:1024743519450:web:d8ec810c43e9cd323e21e3',
    messagingSenderId: '1024743519450',
    projectId: 'lets-talk-e1d2412',
    authDomain: 'lets-talk-e1d2412.firebaseapp.com',
    storageBucket: 'lets-talk-e1d2412.appspot.com',
    measurementId: 'G-Q1EHYC6PT4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOPQZVtGG8HfbAc7VS4cVf8PlpzWEoBCs',
    appId: '1:1024743519450:android:39f3b9d701fb43a13e21e3',
    messagingSenderId: '1024743519450',
    projectId: 'lets-talk-e1d2412',
    storageBucket: 'lets-talk-e1d2412.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDAMtJunHY7ZowBoQ7y7KvIkjTntmZUtfA',
    appId: '1:1024743519450:ios:ab35835deb4929023e21e3',
    messagingSenderId: '1024743519450',
    projectId: 'lets-talk-e1d2412',
    storageBucket: 'lets-talk-e1d2412.appspot.com',
    iosClientId: '1024743519450-ukuahj1t0demncgspo9iua40ldgl4n0m.apps.googleusercontent.com',
    iosBundleId: 'com.letstalk.letsTalk',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDAMtJunHY7ZowBoQ7y7KvIkjTntmZUtfA',
    appId: '1:1024743519450:ios:ab35835deb4929023e21e3',
    messagingSenderId: '1024743519450',
    projectId: 'lets-talk-e1d2412',
    storageBucket: 'lets-talk-e1d2412.appspot.com',
    iosClientId: '1024743519450-ukuahj1t0demncgspo9iua40ldgl4n0m.apps.googleusercontent.com',
    iosBundleId: 'com.letstalk.letsTalk',
  );
}
