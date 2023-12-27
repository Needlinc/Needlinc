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
          'hearts': [],
          'comments': [],
          'postId': randomUrl,
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
          'hearts': [],
          'comments': [],
          'postId': randomUrl,
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
          'postId': randomUrl,
          'hearts': [],
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
          'hearts': [],
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


  Future<dynamic> uploadComments(
      {required BuildContext context, required String message, required String sourceOption, required String id}) async {
    try {
      final User? user = _auth.currentUser;
      int millisecondsSinceEpoch = now.millisecondsSinceEpoch;

      Map<String, dynamic> comment = {
        'profilePicture': await getUserData('profilePicture'),
        'fullName': await getUserData('fullName'),
        'userName': await getUserData('userName'),
        'userCategory': await getUserData('userCategory'),
        'address': await getUserData('address'),
        'userId': user!.uid,
        'message': message,
        'timeStamp': millisecondsSinceEpoch,
        'commentHearts': [],
      };

      // Step 1: Retrieve the current data
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(sourceOption)
          .doc(id)
          .get();
      // Step 2: Modify the 'comments' array within 'postDetails'
      Map<String, dynamic> data = await documentSnapshot.data() as Map<String, dynamic>? ?? {};

      Map<String, dynamic> postDetails = sourceOption == 'homePage' ?
      data['postDetails'] as Map<String, dynamic>? ?? {}
          :
      data['productDetails'] as Map<String, dynamic>? ?? {};

      List<dynamic> currentArray = (postDetails['comments'] as List<dynamic>) ?? [];

      currentArray.add(comment);

      postDetails['comments'] = currentArray;

      // Step 3: Update Firestore with the modified data
      sourceOption == 'homePage' ?
      await FirebaseFirestore.instance.collection(sourceOption).doc(id).update({'postDetails': postDetails})
         :
      await FirebaseFirestore.instance.collection(sourceOption).doc(id).update({'productDetails': postDetails});

    } catch (e) {
      showSnackBar(context, 'Error uploading reply to $sourceOption post $e');
    }
    return true;
  }



  Future<dynamic> uploadHearts(
      {required BuildContext context, required String sourceOption, required String id}) async {
    try {

      // Step 1: Retrieve the current data
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(sourceOption)
          .doc(id)
          .get();
      // Step 2: Modify the 'comments' array within 'postDetails'
      Map<String, dynamic> data = await documentSnapshot.data() as Map<String, dynamic>? ?? {};

      Map<String, dynamic> postDetails = sourceOption == 'homePage' ?
      data['postDetails'] as Map<String, dynamic>? ?? {}
          :
      data['productDetails'] as Map<String, dynamic>? ?? {};

      List<dynamic> currentArray = (postDetails['hearts'] as List<dynamic>) ?? [];


      if (currentArray.contains(_auth.currentUser!.uid)) {
        // If the name is found, remove it from the set
        currentArray.remove(_auth.currentUser!.uid);

      } else {
        // If the name is not found, add it to the set
        currentArray.add(_auth.currentUser!.uid);

      }

      postDetails['hearts'] = currentArray;

      // Step 3: Update Firestore with the modified data
      sourceOption == 'homePage' ?
      await FirebaseFirestore.instance.collection(sourceOption).doc(id).update({'postDetails': postDetails})
          :
      await FirebaseFirestore.instance.collection(sourceOption).doc(id).update({'productDetails': postDetails});

    } catch (e) {
      showSnackBar(context, 'Error');
    }
    return true;
  }






}