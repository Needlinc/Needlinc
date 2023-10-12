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
