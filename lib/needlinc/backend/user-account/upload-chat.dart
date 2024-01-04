import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

final String randomUrl = randomAlphaNumeric(16);

Future<void> sendMessage({
  required String myUserName,
  required String otherUserName,
  required String myUserId,
  required String otherUserId,
  required String replyTo,
  required String text,
  required List<dynamic> image,
  required String recipientToken,
}) async {
  final message = {
    "myUserName": myUserName,
    "otherUserName": otherUserName,
    "myUserId": myUserId,
    "otherUserId": otherUserId,
    "replyTo": replyTo,
    "text": text,
    "image": image,
    "reactions": [],
    "timestamp": FieldValue.serverTimestamp(), // Timestamp from Firestore server
    "isRead": false,
    "recipientToken": recipientToken,
  };

  try {
    await FirebaseFirestore.instance.collection('chats').doc("${myUserId}${otherUserId}").set(
        {
          "participant": [myUserName, otherUserName],
          "chatId": "${myUserId}${otherUserId}",
          "block": false
        }
    );

    await FirebaseFirestore.instance.collection('chats').doc("${myUserId}${otherUserId}")
        .collection('${myUserId}${otherUserId}').add(message);
    print("Message sent successfully");
  } catch (e) {
    print("Error sending message: $e");
  }
}
