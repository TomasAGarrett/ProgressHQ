import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:startertemplate/Service/auth_service.dart';
import '../components/my_login_button.dart';
import '../components/my_square_tile.dart';
import '../components/my_textfield.dart';
import 'login_page.dart';
import 'package:email_validator/email_validator.dart';

/*

L O G I N P A G E

This is the RegisterPage, the first page the user will see based off what was configured in the main.dart file.
This is a minimal aesthetic design, but feel free to decorate it to fit your app.

When considering loggin users into your app, you must consider AUTHENTICATION:

- email sign in
- google sign in
- apple sign in
- facebook sign in, etc

There are many authentication services including firebase. This is highly dependent on your needs.

Once the user is authenticated, they are directed to the homepage.

*/

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required Null Function() togglePage})
      : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  // this is where you would authenticate the user
  // and then direct them to the main page

  Future<void> signUserUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Check if email is valid
    if (!EmailValidator.validate(email)) {
      showErrorMessage("Invalid Email");
      return;
    }

    // Check if passwords match
    if (password != confirmPassword) {
      showErrorMessage("Passwords don't match");
      return;
    }

    // Register user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Show success message
      showSuccessMessage();

      // Navigate to main page
      Navigator.pushReplacementNamed(context, "/main");
    } catch (e) {
      // Show error message
      showErrorMessage(e.toString());
    }
  }

  Future<dynamic> showErrorMessage(String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> showSuccessMessage() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Registration Successful!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
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
                const SizedBox(height: 50),

                // logo
                Icon(
                  Icons.lock,
                  size: 50,
                  color: Colors.grey[900],
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Let\'s get you signed up!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

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

                // confirm password textfield
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
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

                // sign up button
                MyButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png',
                    ),

                    const SizedBox(width: 25),

                    // apple button
                    SquareTile(
                      onTap: () {},
                      imagePath: 'lib/images/apple.png',
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // don't have an account?
                    Text(
                      'Already Have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),

                    // register button
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(
                              togglePage: () {},
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Login Here',
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
