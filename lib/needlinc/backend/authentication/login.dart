import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:needlinc/needlinc/backend/user-account/functionality.dart';
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




    User? cred = FirebaseAuth.instance.currentUser;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var snapShot = await _firestore.collection('users').doc(cred!.uid).get();
    if (snapShot.exists) {
      Map<String, dynamic> data = snapShot.data()!;
      saveUserData('profilePicture', "${ await data['profilePicture']}");
      saveUserData('fullName', "${ await data['fullName']}");
      saveUserData('userName', "${ await data['userName']}");
      saveUserData('userCategory', "${ await data['userCategory']}");
      saveUserData('address', "${ await data['address']}");
    }





    return userCredential.user!;
  } catch (e) {
    showSnackBar(context,'Error logging in: $e');
    return null; // Handle the error as needed
  }
}


