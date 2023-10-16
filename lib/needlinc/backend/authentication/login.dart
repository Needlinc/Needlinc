import 'package:firebase_auth/firebase_auth.dart';

Future<User?> loginUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user!;
  } catch (e) {
    print('Error logging in: $e');
    return null; // Handle the error as needed
  }
}
