import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:startertemplate/main_page.dart';
import 'package:startertemplate/pages/login_page.dart';
import 'package:startertemplate/pages/register_page.dart';

// this is the authentication page
// this page will listen to the authentication state
// if the user is null, we will show the login page

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // this is the stream that will listen to the authentication state
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  bool showLoginPage = true;

  void togglePage() {
    // this will toggle the page
    // if the user is on the login page, it will show the register page
    // if the user is on the register page, it will show the login page
    setState(() {});
  }

  bool get showLogin => showLoginPage = !showLoginPage;

  @override
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
            return showLogin
                ? LoginPage(
                    togglePage: () {},
                  )
                : RegisterPage(
                    togglePage: () {},
                  );
          }
        },
      ),
    );
  }
}
