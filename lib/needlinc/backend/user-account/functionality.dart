import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

    // Storing data in local storage
    Future<void> saveUserData(String key, String value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    }

    // Retrieving data from local storage
    Future<String?> getUserData(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    }

    // Removing data from local storage
    Future<void> removeUserData(String key) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    }


    Future<void> getGender({
      required String gender,
    }) async {
      // Add user gender info in local storage
      saveUserData('gender', gender);
    }


    Future<void> displayProfileOption({
      required bool profileOption,
    }) async {
      // Add user data in local storage
      saveUserData('profileOption', '$profileOption');

    }



    Future<void> getDateOfBirth({
      required String birthDay,
    }) async {
      // Add user birth day date in local storage
      saveUserData('birthDay', birthDay);
    }



    Future<void> addLocation({
      required String location,
    }) async {
      // Add user birth day date in local storage
      saveUserData('address', location);
    }

    Future<void> addPhoneNumber({
      required String phoneNumber,
    }) async {
      // Add user birth day date in local storage
      saveUserData('phoneNumber', phoneNumber);
    }

    Future<void> addProfilePictureUrl({
      required String url,
    }) async {
      // Add user birth day date in local storage
      saveUserData('profilePicture', url);
    }

    Future<void> userCategory({
      required BuildContext context,
      required String userType,
    }) async {
      // Add user birth day date in local storage
      saveUserData('userCategory', userType);
      showSnackBar(context, 'User profile updated successfully!');
    }



    //Todo upload Profile Picture to FirebaseStorage
    Future<String> uploadProfilePicture(Uint8List imageBytes) async {
      try {
        final String randomUrl = randomAlphaNumeric(16);

        final Reference storageRef = FirebaseStorage.instance.ref().child('profilePictures/${randomUrl}.jpg');
        final UploadTask uploadTask = storageRef.putData(imageBytes);

        await uploadTask;

        final imageUrl = await storageRef.getDownloadURL();
        return imageUrl;
      } catch (error) {
        return ('Error uploading image to Firebase Storage: $error');
      }
    }



    //Todo Delete Profile Picture from FirebaseStorage
    Future<String> deleteProfilePicture(String imageUrl) async {
      try {
        final Reference storageRef = FirebaseStorage.instance.refFromURL(imageUrl);
        await storageRef.delete();

        return 'Image successfully deleted from Firebase Storage';
      } catch (error) {
        return 'Error deleting image from Firebase Storage: $error';
      }
    }

