import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:startertemplate/main_page.dart';
import 'login_or_register_page.dart';

// this is the authentication page
// this page will listen to the authentication state
// if the user is null, we will show the login page
// if the user is not null, we will show the main page
// this is a stateless widget because we are not changing the state of the widget

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  //
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // this is the stream that will listen to the authentication state
        stream: FirebaseAuth.instance.authStateChanges(),
        //  this is the builder that will be called every time the stream emits a new value
        builder: (context, snapshot) {
          // snapshot is the value emitted by the stream
          // if the connection is active, we can check if the user is null or not
          if (snapshot.data != null) {
            // if the user is not null, we will show the main page
            return const MainPage();
          }
          // if the user is null, we will show the login page
          else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
