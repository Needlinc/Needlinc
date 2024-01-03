import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';


class DeletePost {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  DateTime now = DateTime.now();
  final String randomUrl = randomAlphaNumeric(16);



  //Todo Delete Home Post for Images and Write Ups
  Future<bool> deleteHomePageImageAndWriteupPost(BuildContext context, String postId) async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        showSnackBar(context, 'User not logged in');
        return false;
      }

      // Get post details from Firestore
      DocumentSnapshot postSnapshot = await _firestore.collection('homePage')
          .doc(postId)
          .get();
      if (!postSnapshot.exists) {
        showSnackBar(context, 'Post not found');
        return false;
      }

      Map<String, dynamic> postData = postSnapshot.data() as Map<String,
          dynamic>;
      List<dynamic> imageUrls = postData['postDetails']['images'];

      // Delete images from Firebase Storage
      for (var imageUrl in imageUrls) {
        final Reference storageRef = _firebaseStorage.refFromURL(imageUrl);
        await storageRef.delete();
      }

      // Delete post data from Firestore
      await _firestore.collection('homePage').doc(postId).delete();

      showSnackBar(context, 'Home page post successfully deleted!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error deleting post from homepage: $e');
      return false;
    }
  }




  //Todo Delete Home Post for Images
  Future<bool> deleteHomePageImagePost(BuildContext context, String postId) async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        showSnackBar(context, 'User not logged in');
        return false;
      }

      // Get post details from Firestore
      DocumentSnapshot postSnapshot = await _firestore.collection('homePage').doc(postId).get();
      if (!postSnapshot.exists) {
        showSnackBar(context, 'Post not found');
        return false;
      }

      Map<String, dynamic> postData = postSnapshot.data() as Map<String, dynamic>;
      List<dynamic> imageUrls = postData['postDetails']['images'];

      // Delete images from Firebase Storage
      for (var imageUrl in imageUrls) {
        final Reference storageRef = _firebaseStorage.refFromURL(imageUrl);
        await storageRef.delete();
      }

      // Delete post data from Firestore
      await _firestore.collection('homePage').doc(postId).delete();

      showSnackBar(context, 'Home page image post successfully deleted!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error deleting image post from homepage: $e');
      return false;
    }
  }





  //Todo Upload Home Post for Write Ups
  Future<bool> deleteHomePageWriteUpPost(BuildContext context, String postId) async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        showSnackBar(context, 'User not logged in');
        return false;
      }

      // Check if the post exists in Firestore
      DocumentSnapshot postSnapshot = await _firestore.collection('homePage').doc(postId).get();
      if (!postSnapshot.exists) {
        showSnackBar(context, 'Post not found');
        return false;
      }

      // Delete post data from Firestore
      await _firestore.collection('homePage').doc(postId).delete();

      showSnackBar(context, 'Home page write-up post successfully deleted!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error deleting write-up post from homepage: $e');
      return false;
    }
  }






  Future<bool> deleteMarketPlacePost(BuildContext context, String productId) async {
    try {
      final User? user = _auth.currentUser;
      if (user == null) {
        showSnackBar(context, 'User not logged in');
        return false;
      }

      // Get product details from Firestore
      DocumentSnapshot productSnapshot = await _firestore.collection('marketPlacePage').doc(productId).get();
      if (!productSnapshot.exists) {
        showSnackBar(context, 'Product not found');
        return false;
      }

      Map<String, dynamic> productData = productSnapshot.data() as Map<String, dynamic>;
      List<dynamic> imageUrls = productData['productDetails']['images'];

      // Delete images from Firebase Storage
      for (var imageUrl in imageUrls) {
        final Reference storageRef = _firebaseStorage.refFromURL(imageUrl);
        await storageRef.delete();
      }

      // Delete product data from Firestore
      await _firestore.collection('marketPlacePage').doc(productId).delete();

      showSnackBar(context, 'Market Place post successfully deleted!');
      return true;
    } catch (e) {
      showSnackBar(context, 'Error deleting post from Market Place page: $e');
      return false;
    }
  }














}