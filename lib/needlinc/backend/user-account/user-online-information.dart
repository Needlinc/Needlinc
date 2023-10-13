import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class UserAccount {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String uid;

  UserAccount(this.uid);

  Future<void> updateUserProfile({
    required String fullName,
    required String nickName,
    required String email,
    required String password,
  //  required PickedFile profilePicture,
  }) async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;
      if (user!.uid != uid) {
        print('User ID does not match the provided UID.');
        return;
      }

      // // Upload profile picture to Firebase Storage
      // final Reference storageRef = _storage.ref().child('profile_pictures/$uid.jpg');
      // final File imageFile = File(profilePicture.path);
      // await storageRef.putFile(imageFile);
      // final String downloadURL = await storageRef.getDownloadURL();

      // Update user data in Firestore
      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName,
        'nickName': nickName,
        'password': password,
        'email': email,
     //   'profile_picture_url': downloadURL,
      });

      print('User profile updated successfully!');
    } catch (e) {
      print('Error updating user profile: $e');
    }
  }
}
