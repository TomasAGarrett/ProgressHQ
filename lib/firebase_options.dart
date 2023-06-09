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
    apiKey: 'AIzaSyCeJxZ_1YjxHlpLsmklt0vYm36npZuaJOo',
    appId: '1:483734121868:web:aeaa570fb3d6ded306baa9',
    messagingSenderId: '483734121868',
    projectId: 'loginauth-3aab7',
    authDomain: 'loginauth-3aab7.firebaseapp.com',
    storageBucket: 'loginauth-3aab7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxmd-qJKon0YXXie2exQe1aIKK4IsbjA4',
    appId: '1:483734121868:android:7650b210711e776c06baa9',
    messagingSenderId: '483734121868',
    projectId: 'loginauth-3aab7',
    storageBucket: 'loginauth-3aab7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1HsxOB6WXP4BREKVBLk8vrVJ1mAyA3D8',
    appId: '1:483734121868:ios:37908e60e3836c5306baa9',
    messagingSenderId: '483734121868',
    projectId: 'loginauth-3aab7',
    storageBucket: 'loginauth-3aab7.appspot.com',
    iosClientId: '483734121868-o3gbu3634ff2t67ne1n95ulnib1kqcmu.apps.googleusercontent.com',
    iosBundleId: 'com.example.startertemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1HsxOB6WXP4BREKVBLk8vrVJ1mAyA3D8',
    appId: '1:483734121868:ios:37908e60e3836c5306baa9',
    messagingSenderId: '483734121868',
    projectId: 'loginauth-3aab7',
    storageBucket: 'loginauth-3aab7.appspot.com',
    iosClientId: '483734121868-o3gbu3634ff2t67ne1n95ulnib1kqcmu.apps.googleusercontent.com',
    iosBundleId: 'com.example.startertemplate',
  );
}
