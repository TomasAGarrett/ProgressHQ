import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  signInWithGoogle() async {
      // Trigger the authentication flow
      // do not use await here, otherwise the app will freeze
      // and the user will not be able to see the google sign in screen
      // and they will be sad
      // and they will uninstall your app
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
      // await is important here, otherwise the app will freeze
          await googleUser!.authentication;
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        // accessToken and idToken are required
        // they are used to authenticate the user
        // and to make sure the user is who they say they are
        // and to make sure the user is not a robot
        // and to make sure the user is not a cat
        // and to make sure the user is not a dog
        // and to make sure the user is not a fish
        // and to make sure the user is not a bird
        // and to make sure the user is not a tree
        // and to make sure the user is not a rock
        // and to make sure the user is not a mountain
        // and to make sure the user is not a river
        // and to make sure the user is not a lake
        // and to make sure the user is not a cloud
        // and to make sure the user is not a flower
        // and to make sure the user is not a plant
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}