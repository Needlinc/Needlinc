import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../shared-pages/user-type.dart';
import '../../widgets/snack-bar.dart';

Future<User?> loginUser(String email, String password, BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                UserType()));
    showSnackBar(context,'Welcome back!');
    return userCredential.user!;
  } catch (e) {
    showSnackBar(context,'Error logging in: $e');
    return null; // Handle the error as needed
  }
}
