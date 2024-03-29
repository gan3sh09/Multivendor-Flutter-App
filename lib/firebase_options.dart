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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMobYPOU5adoaKUWVdbzQALiH2TMvnXyY',
    appId: '1:959407401672:android:558a3f9706ae525c2153fd',
    messagingSenderId: '959407401672',
    projectId: 'market-hub-5b4dc',
    storageBucket: 'market-hub-5b4dc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcNMgSKoX_Sbipr3DYYvXWWiUPILvQrfA',
    appId: '1:959407401672:ios:eca05fcb215f62752153fd',
    messagingSenderId: '959407401672',
    projectId: 'market-hub-5b4dc',
    storageBucket: 'market-hub-5b4dc.appspot.com',
    androidClientId: '959407401672-me3u5m07sd9dq2ngkp40hkc78fnasj3o.apps.googleusercontent.com',
    iosClientId: '959407401672-g1r78j2insprg4jvholohbjl0s115tok.apps.googleusercontent.com',
    iosBundleId: 'com.example.marketHub',
  );
}
