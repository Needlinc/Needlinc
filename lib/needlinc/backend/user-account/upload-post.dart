import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:needlinc/needlinc/backend/user-account/functionality.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';

class UploadPost{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  DateTime now = DateTime.now();


  Future<bool> homePagePostForImageAndWriteUp(context, image, String writeUp, String freelancerOption) async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;

      final String randomUrl = randomAlphaNumeric(16);

      final Reference storageRef = _firebaseStorage.ref().child('homePage/$randomUrl');
      final UploadTask uploadTask = storageRef.putData(image);

      await uploadTask;

      final imageUrl = await storageRef.getDownloadURL();
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
      // Update user data in Firestore
      await _firestore.collection('homePage').doc(randomUrl).set({
        'userDetails': {
          'profilePicture': await getUserData('profilePicture'),
          'fullName': await getUserData('fullName'),
          'userName': await getUserData('userName'),
          'userCategory': await getUserData('userCategory'),
          'address': await getUserData('address'),
          'userId': user!.uid,
        },
        'postDetails': {
          'image': imageUrl,
          'writeUp': writeUp,
          'freelancerOption': freelancerOption ?? "null",
          'hearts': 0,
          'comments': [],
          'userId': user.uid,
          'timeStamp': millisecondsSinceEpoch
        }
      });
      showSnackBar(context, 'Home page post successfully uploaded!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to homepage $e');
    }
    return true;
  }


  Future<bool> homePagePostForImage(context, image, String freelancerOption) async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;

      final String randomUrl = randomAlphaNumeric(16);

      final Reference storageRef = _firebaseStorage.ref().child('homePage/$randomUrl');
      final UploadTask uploadTask = storageRef.putData(image);

      await uploadTask;

      final imageUrl = await storageRef.getDownloadURL();
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
      // Update user data in Firestore
      await _firestore.collection('homePage').doc(randomUrl).set({
        'userDetails': {
          'profilePicture': await getUserData('profilePicture'),
          'fullName': await getUserData('fullName'),
          'userName': await getUserData('userName'),
          'userCategory': await getUserData('userCategory'),
          'address': await getUserData('address'),
          'userId': user!.uid,
        },
        'postDetails': {
          'image': imageUrl,
          'writeUp': "null",
          'freelancerOption': freelancerOption ?? "null",
          'hearts': 0,
          'comments': [],
          'userId': user.uid,
          'timeStamp': millisecondsSinceEpoch
        }
      });
      showSnackBar(context, 'Home page post successfully uploaded!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to homepage $e');
      print("$e");
    }
    return true;
  }



  Future<bool> homePagePostForWriteUp(context, String writeUp, String freelancerOption) async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;

      final String randomUrl = randomAlphaNumeric(16);
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
      // Update user data in Firestore
      await _firestore.collection('homePage').doc(randomUrl).set({
        'userDetails': {
          'profilePicture': await getUserData('profilePicture'),
          'fullName': await getUserData('fullName'),
          'userName': await getUserData('userName'),
          'userCategory': await getUserData('userCategory'),
          'address': await getUserData('address'),
          'userId': user!.uid,
        },
        'postDetails': {
          'image': "null",
          'writeUp': writeUp,
          'freelancerOption': freelancerOption ?? "null",
          'userId': user.uid,
          'hearts': 0,
          'comments': [],
          'timeStamp': millisecondsSinceEpoch
        }
      });
      showSnackBar(context, 'Home page post successfully uploaded!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to homepage $e');
    }
    return true;
  }







  Future<bool> MarketPlacePost(
      {
        required BuildContext context,
        required image,
        required String description,
        required String productName,
        required String price,
        required String category
      }) async {
    try {
      // Use the provided uid for the user
      final User? user = _auth.currentUser;

      final String randomUrl = randomAlphaNumeric(16);

      final Reference storageRef = _firebaseStorage.ref().child('marketPlacePage/$randomUrl');
      final UploadTask uploadTask = storageRef.putData(image);

      await uploadTask;

      final imageUrl = await storageRef.getDownloadURL();
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;
      // Update user data in Firestore
      await _firestore.collection('marketPlacePage').doc(randomUrl).set({
        'userDetails': {
          'profilePicture': await getUserData('profilePicture'),
          'fullName': await getUserData('fullName'),
          'userName': await getUserData('userName'),
          'userCategory': await getUserData('userCategory'),
          'address': await getUserData('address'),
          'userId': user!.uid,
        },
        'productDetails': {
          'image': imageUrl,
          'name': productName,
          'description': description,
          'price': price,
          'category': category,
          'hearts': 0,
          'comments': [],
          'productId': randomUrl,
          'timeStamp': millisecondsSinceEpoch
        }
      });
      showSnackBar(context, 'Market Place page post successfully uploaded!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to Market Place page $e');
    }
    return true;
  }



}