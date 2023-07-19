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
    apiKey: 'AIzaSyBC7LwIzFcZbY3SpB11n_NcDwF5zmXtjyE',
    appId: '1:798159332068:web:33d5e2f07486cc9bae02f1',
    messagingSenderId: '798159332068',
    projectId: 'investtor-tz',
    authDomain: 'investtor-tz.firebaseapp.com',
    storageBucket: 'investtor-tz.appspot.com',
    measurementId: 'G-PV160FVEHH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqWIQkqKjGuvPIEz5iflu1OPemXUWVP4A',
    appId: '1:798159332068:android:d0b65d750e36d163ae02f1',
    messagingSenderId: '798159332068',
    projectId: 'investtor-tz',
    storageBucket: 'investtor-tz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiHOIHuM9gL6OoxY8RiWar04KH08kZvqE',
    appId: '1:798159332068:ios:14f95ec534ae621dae02f1',
    messagingSenderId: '798159332068',
    projectId: 'investtor-tz',
    storageBucket: 'investtor-tz.appspot.com',
    iosClientId: '798159332068-93s8fekg754lh6uo3p5dma6u41hk0tbt.apps.googleusercontent.com',
    iosBundleId: 'com.badiz.investtor',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiHOIHuM9gL6OoxY8RiWar04KH08kZvqE',
    appId: '1:798159332068:ios:32a564742a005b16ae02f1',
    messagingSenderId: '798159332068',
    projectId: 'investtor-tz',
    storageBucket: 'investtor-tz.appspot.com',
    iosClientId: '798159332068-1j47gsnrgdsurr7tqbivcjf3q3e18811.apps.googleusercontent.com',
    iosBundleId: 'com.investor.investorFlutter',
  );
}
