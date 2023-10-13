import 'dart:typed_data';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
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


Future<PickedFile> convertUint8ListToPickedFile(Uint8List uint8List) async {
  final String tempDir = (await getTemporaryDirectory()).path;
  final String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';

  final File tempFile = File('$tempDir/$fileName');

  await tempFile.writeAsBytes(uint8List);

  return PickedFile(tempFile.path);
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
