import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/auth_page.dart';
import 'main_page.dart';

/*

S T A R T

This is the starting point for all apps. 
Everything starts at the main function

*/
Future<void> main() async {
  // lets run our app
  WidgetsFlutterBinding.ensureInitialized();
  // initialize Firebase
  await Firebase.initializeApp(
    // this is the FirebaseOptions object that we created in firebase_options.dart
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // this is the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => const MainPage(),
      },
      debugShowCheckedModeBanner: false,
      // this is bringing us to the AuthPage first
      home: const AuthPage(),
    );
  }
}
