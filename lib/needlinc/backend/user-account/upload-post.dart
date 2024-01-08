import 'dart:typed_data';
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
  final String randomUrl = randomAlphaNumeric(16);
  DateTime now = DateTime.now();


  //Todo Upload Home Post for Images and Write Ups
  Future<bool> homePagePostForImageAndWriteUp(
      BuildContext context,
      List<Uint8List> images,
      String writeUp,
      String freelancerOption
      ) async {
    try {
      final User? user = _auth.currentUser;
      List<String> imageUrls = [];

      // Upload each image and collect URLs
      for (var image in images) {
        final Reference storageRef = _firebaseStorage.ref().child('homePage/${user!.uid}/$randomUrl');
        final UploadTask uploadTask = storageRef.putData(image);

        await uploadTask;
        String imageUrl = await storageRef.getDownloadURL();
        imageUrls.add(imageUrl);
      }


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
          'images': imageUrls, // Storing multiple image URLs
          'writeUp': writeUp,
          'freelancerOption': freelancerOption ?? "null",
          'hearts': [],
          'comments': [],
          'postId': randomUrl,
          'timeStamp': now.millisecondsSinceEpoch,
        }
      });
      showSnackBar(context, 'Home page post successfully uploaded!');

      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to homepage: $e');
      return false;
    }
  }



  //Todo Upload Home Post for Images

  Future<bool> homePagePostForImage(
      BuildContext context,
      List<Uint8List> images,
      String freelancerOption
      ) async {
    try {
      final User? user = _auth.currentUser;
      List<String> imageUrls = [];

      // Upload each image and collect URLs
      for (var image in images) {
        final String randomUrl = randomAlphaNumeric(16);
        final Reference storageRef = _firebaseStorage.ref().child('homePage/${user!.uid}/$randomUrl');
        final UploadTask uploadTask = storageRef.putData(image);

        await uploadTask;
        String imageUrl = await storageRef.getDownloadURL();
        imageUrls.add(imageUrl);
      }


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
          'images': imageUrls, // Storing multiple image URLs
          'writeUp': "null",
          'freelancerOption': freelancerOption ?? "null",
          'hearts': [],
          'comments': [],
          'postId': randomUrl,
          'timeStamp': now.millisecondsSinceEpoch,
        }
      });
      showSnackBar(context, 'Home page post successfully uploaded!');

      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to homepage: $e');
      return false;
    }
  }




  //Todo Upload Home Post for Write Ups
  Future<bool> homePagePostForWriteUp(context, String writeUp, String freelancerOption) async {
    try {
        // Use the provided uid for the user
        final User? user = _auth.currentUser;


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
            'images': [],
            'writeUp': writeUp,
            'freelancerOption': freelancerOption ?? "null",
            'postId': randomUrl,
            'hearts': [],
            'comments': [],
            'timeStamp': now.millisecondsSinceEpoch,
          }
        });
        showSnackBar(context, 'Home page post successfully uploaded!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to homepage $e');
    }
    return true;
  }


  //Todo upload MarketPlace Uploading function
  Future<bool> MarketPlacePost({
    required BuildContext context,
    required List<Uint8List> images,
    required String description,
    required String productName,
    required String price,
    required String category,
  }) async {
    try {
      final User? user = _auth.currentUser;
      final String productUrl = randomAlphaNumeric(16); // Unique identifier for the product
      List<String> imageUrls = [];

      for (var image in images) {
        final String imageId = randomAlphaNumeric(16); // Unique identifier for each image
        final Reference storageRef = _firebaseStorage.ref().child('marketPlacePage/${user!.uid}/$productUrl/$imageId');
        final UploadTask uploadTask = storageRef.putData(image);

        await uploadTask.whenComplete(() => null);
        String imageUrl = await storageRef.getDownloadURL();
        imageUrls.add(imageUrl);
      }

      int millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;

      await _firestore.collection('marketPlacePage').doc(productUrl).set({
        'userDetails': {
          'profilePicture': await getUserData('profilePicture'),
          'fullName': await getUserData('fullName'),
          'userName': await getUserData('userName'),
          'userCategory': await getUserData('userCategory'),
          'address': await getUserData('address'),
          'userId': user!.uid,
        },
        'productDetails': {
          'images': imageUrls, // Note: Field name changed to 'images' to reflect that it's a list
          'name': productName,
          'description': description,
          'price': price,
          'category': category,
          'hearts': [],
          'comments': [],
          'productId': productUrl,
          'timeStamp': millisecondsSinceEpoch,
        },
      });

      showSnackBar(context, 'Market Place page post successfully uploaded!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error uploading post to Market Place page: $e');
      return false;
    }
  }



   //Todo Uploading Homepage and MarketPlace Comments
  Future<dynamic> uploadComments(
      {required BuildContext context, required String message, required String sourceOption, required String id}) async {
    try {
      final User? user = _auth.currentUser;

      Map<String, dynamic> comment = {
        'profilePicture': await getUserData('profilePicture'),
        'fullName': await getUserData('fullName'),
        'userName': await getUserData('userName'),
        'userCategory': await getUserData('userCategory'),
        'address': await getUserData('address'),
        'userId': user!.uid,
        'message': message,
        'timeStamp': now.millisecondsSinceEpoch,
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


     //Todo Uploading Homepage and MarketPlace uploadHearts
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