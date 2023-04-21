import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startertemplate/Service/auth_service.dart';
import '../components/my_login_button.dart';
import '../components/my_square_tile.dart';
import '../components/my_textfield.dart';
import 'register_page.dart';

/*

L O G I N P A G E

This is the LoginPage, the first page the user will see 
based off what was configured in the main.dart file.

When considering loggin users into your app, you must consider AUTHENTICATION:

- email sign in
- google sign in
- apple sign in
- facebook sign in, etc

Once the user is authenticated, they are directed to the homepage.

*/

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required void Function() togglePage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void togglePage() {
    setState(() {});
  }

  // text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  // this is where you would authenticate the user
  // and then direct them to the main page
  Future<void> signUserIn() async {
    // show loading dialog
    // this is important if the user has a slow internet connection
    //  and they are waiting for the app to respond
    //  and they don't know what is happening
    //  and they are sad
    //  and they uninstall your app
    //  and you are sad
    //  and you cry
    //  and you uninstall your app
    showDialog(
      context: context,
      builder: (context) => const Center(
        // loading indicator
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop loading dialog
      Navigator.pop(context);
      // show error message
      // this is important if the user enters the wrong email
      //  and they are waiting for the app to respond
      //  and they don't know what is happening
      //  and they are sad
      //  and they uninstall your app
      showErrorMessage(e.code);
    }
    // once user is authenticated, direct them to the main page
  }

  Future<dynamic> showErrorMessage(String errorCode) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              errorCode,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          // scrollable
          // this is important if the user has a small screen
          //  and the keyboard pops up
          //  and the user can't see the login button
          //  and they can't scroll down to see the login button
          //  and they can't login
          //  and they are sad
          //  and they uninstall your app
          //  and you are sad
          //  and you cry
          //  and you uninstall your app
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Image.asset(
                  'lib/images/logoPreto.png',
                  width: 350,
                ), // image.asset

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  text: 'Sign In',
                  onTap: signUserIn,
                ),

                const SizedBox(height: 15),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // don't have an account?
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    // sign up button
                    TextButton(
                      onPressed: () {
                        // direct user to sign up page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(
                              togglePage: () {},
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
