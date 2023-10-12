import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'dart:typed_data';

class SignUp {
  final String fullName;
  final String nickName;
  final String email;
  final String password;
  final Uint8List profilePicture;

  SignUp(this.fullName, this.nickName, this.email, this.password, this.profilePicture);

  Future<UserCredential?> signUpWithEmailPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // You can add more logic here to save additional user information to the database, like full name, nickname, and profile picture.
      return userCredential;
    } catch (e) {
      print("Error signing up with email and password: $e");
      return null;
    }
  }

  Future<UserCredential?> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // You can add more logic here to save additional user information to the database, like full name, nickname, and profile picture.

      return userCredential;
    } catch (e) {
      print("Error signing up with Google: $e");
      return null;
    }
  }

  Future<UserCredential?> signUpWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ["email"]);

      if (result.status == LoginStatus.success) {
        final AuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

        // You can add more logic here to save additional user information to the database, like full name, nickname, and profile picture.

        return userCredential;
      } else {
        print("Error signing up with Facebook: ${result.status}");
        return null;
      }
    } catch (e) {
      print("Error signing up with Facebook: $e");
      return null;
    }
  }
}
