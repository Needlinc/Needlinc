import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:needlinc/needlinc/backend/user-account/functionality.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';

class UserAccount {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String uid;

  UserAccount(this.uid);

  Future<void> updateUserProfile({
    required BuildContext context,
    required String fullName,
    required String nickName,
    required String email,
    required String password,
    required String profilePicture,
    required String userID
  }) async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;
      addProfilePictureUrl(url: profilePicture);
      // Update user data in Firestore
      await _firestore.collection('users').doc(user!.uid).set({
        'fullName': fullName,
        'nickName': nickName,
        'password': password,
        'email': email,
        'pickedProfilePicture': profilePicture,
        'UserID': userID
      });

    } catch (e) {
      showSnackBar(context, 'Error $e');
    }
  }






  Future<void> updateUserCompleteProfile() async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;

      //Getting the stored profile data from local storage to upload to firebasefirestore
      final gender = await getUserData('gender');
      final profileOption = await getUserData('profileOption');
      final birthDay = await getUserData('birthDay');
      final location = await getUserData('address');
      final phoneNumber = await getUserData('phoneNumber');
      final userCategory = await getUserData('userCategory');

      // Update user data in Firestore
      await _firestore.collection('users').doc(user!.uid).update({
        'gender': gender,
        'profileOption': profileOption,
        'birthDay': birthDay,
        'address': location,
        'phoneNumber': phoneNumber,
        'userCategory': userCategory
      });

      print('User profile updated successfully!');
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }



}
