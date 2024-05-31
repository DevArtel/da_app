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
    apiKey: 'AIzaSyA9ePUqCAqauLjRADdb7VNaT_PvdLA91J4',
    appId: '1:614292160353:web:6a663dcd93a29ec5130f20',
    messagingSenderId: '614292160353',
    projectId: 'da-app-2b7e1',
    authDomain: 'da-app-2b7e1.firebaseapp.com',
    storageBucket: 'da-app-2b7e1.appspot.com',
    measurementId: 'G-5HCDWFRBXY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBjQpyn26ddx5ajJ4U7pWiyuoM96ztTEqI',
    appId: '1:614292160353:android:cda1f697d3828b94130f20',
    messagingSenderId: '614292160353',
    projectId: 'da-app-2b7e1',
    storageBucket: 'da-app-2b7e1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3Ji77DPLyvEpbRezD93TL_i77HHtLuFo',
    appId: '1:614292160353:ios:7e79015086670c7a130f20',
    messagingSenderId: '614292160353',
    projectId: 'da-app-2b7e1',
    storageBucket: 'da-app-2b7e1.appspot.com',
    iosBundleId: 'YF7VY6LB6A.io.devartel.daApp',
  );
}