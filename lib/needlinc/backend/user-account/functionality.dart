import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:needlinc/needlinc/widgets/snack-bar.dart';
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



// void main() {
//   // Storing data in local storage
//   saveUserData('username', 'JohnDoe');
//
//   // Retrieving data from local storage
//   getUserData('username').then((value) {
//     print('Username: $value');
//   });
//
//   // Removing data from local storage
//   removeUserData('username');
// }


Future<String> uploadImageToFirebase(Uint8List imageBytes) async {
  try {
    String userId = await FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDetails = await FirebaseFirestore.instance.collection("'users").doc(userId).get();
    String fullName = userDetails['fullName'];
    String userName = userDetails['userName'];
    final Reference storageRef = FirebaseStorage.instance.ref().child('profilePictures/${userId}/${userName}-${fullName}.jpg');
    final UploadTask uploadTask = storageRef.putData(imageBytes);

    await uploadTask;

    final imageUrl = await storageRef.getDownloadURL();
    return imageUrl;
  } catch (error) {
    print('Error uploading image to Firebase Storage: $error');
    return ('Error uploading image to Firebase Storage: $error');
  }
}



//Todo working on multi-images



Future<List<String>> uploadImagesToFirebase(List<Uint8List> imageList) async {
  try {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDetails = await FirebaseFirestore.instance.collection("users").doc(userId).get();
    String fullName = userDetails['fullName'];
    String userName = userDetails['userName'];

    List<String> imageUrls = [];

    for (int i = 0; i < imageList.length; i++) {
      Uint8List imageBytes = imageList[i];

      final Reference storageRef = FirebaseStorage.instance.ref().child('profilePictures/$userId/${userName}-${fullName}_$i.jpg');
      final UploadTask uploadTask = storageRef.putData(imageBytes);

      await uploadTask;
      final imageUrl = await storageRef.getDownloadURL();
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  } catch (error) {
    print('Error uploading images to Firebase Storage: $error');
    return ['Error uploading images to Firebase Storage: $error'];
  }
}
