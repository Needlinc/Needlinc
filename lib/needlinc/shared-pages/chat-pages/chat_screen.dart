import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import "package:grouped_list/grouped_list.dart";
import "package:intl/intl.dart";
import "package:needlinc/needlinc/colors/colors.dart";
import "package:needlinc/needlinc/shared-pages/chat-pages/set_appointment.dart";
import "package:needlinc/needlinc/widgets/snack-bar.dart";

import "../../backend/user-account/upload-chat.dart";


class ChatScreen extends StatefulWidget {
  final String myProfilePicture;
  final String otherProfilePicture;
  final String myUserId;
  final String otherUserId;
  final String myUserName;
  final String otherUserName;

  // Add a constructor to ChatScreen that takes userId as a parameter
  ChatScreen({
    Key? key,
    required this.myProfilePicture,
    required this.otherProfilePicture,
    required this.myUserId,
    required this.otherUserId,
    required this.myUserName,
    required this.otherUserName
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();

  late String userId = widget.myUserId;
  Stream<QuerySnapshot>? messageStream;
  String? chatId;

  void getStream() async {

    String myUserId = widget.myUserId;
    String otherUserId = widget.otherUserId;

    String chatDocumentId = "${myUserId}${otherUserId}";
    String alternativeId = "${otherUserId}${myUserId}";

    // Check if the document exists with the first combination
    var firstSnapshot = await FirebaseFirestore.instance
        .collection('chats').doc(chatDocumentId).get();

    var secondSnapshot = await FirebaseFirestore.instance
        .collection('chats').doc(alternativeId).get();

    if (firstSnapshot.exists) {
      chatId = chatDocumentId; // Document exists, return its ID
    }
    else if (secondSnapshot.exists) {
      chatId = alternativeId; // Document exists, return its ID
    }
    else {
      chatId = chatDocumentId;
    }




     messageStream = FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId!)
        .collection(chatId!)
        .orderBy('timeStamp', descending: false)
        .snapshots();
    // Call setState if necessary to refresh the StreamBuilder
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    getStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
            color: NeedlincColors.blue1
        ),
        title: Text(
            "NeedLinc",
            style: TextStyle(color: NeedlincColors.blue1)
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.call_outlined),
              onPressed:() {},
              color: NeedlincColors.blue1
          ),
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed:() {},
              color: NeedlincColors.blue1
          ),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed:() {},
              color: NeedlincColors.blue1
          ),
        ],
        backgroundColor: NeedlincColors.white,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messageStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var data = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var chatData = data[index].data() as Map<String, dynamic>; // Access each document's data

                    return Align(
                      alignment: userId == chatData['myUserId'] ? Alignment.topRight : Alignment.topLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: userId == chatData['myUserId'] ? NeedlincColors.white : NeedlincColors.black2,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: NeedlincColors.black3.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: userId == chatData['myUserId'] ? NetworkImage("${widget.myProfilePicture}") : NetworkImage("${widget.otherProfilePicture}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    chatData['myUserName'],
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                              chatData['text'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          //The bottom bar of the app including the message field
          Container(
            padding: EdgeInsets.all(2),
            color: Colors.white70,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add_outlined),
                  onPressed: () {
                    // TODO: implement an action
                  },
                  color: NeedlincColors.blue1,
                ),
                IconButton(
                  icon: Icon(Icons.mic_outlined),
                  onPressed: () {
                    // TODO: implement an action
                  },
                  color: NeedlincColors.blue1,
                ),

                //TODO: Adjust the size of the message textfield ensuring that text goes to the next line
                //Message typing feature, behaviour and properties
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: InputDecoration(
                              hintText: "Message...",
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                            onSubmitted: (text) {
                              sendMessage(
                                  myProfilePicture: widget.myProfilePicture,
                                  otherProfilePicture: widget.otherProfilePicture,
                                  myUserName: widget.myUserName,
                                  otherUserName: widget.otherUserName,
                                  myUserId: widget.myUserId,
                                  otherUserId: widget.otherUserId,
                                  replyTo: '',
                                  text: _textController.text,
                                  image: [],
                                  myToken: '',
                                  otherToken: '');
                              setState(() {
                                _textController.clear();
                              });
                            },
                          ),
                        ),

                        //Send button in the message field
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            sendMessage(
                                myProfilePicture: widget.myProfilePicture,
                                otherProfilePicture: widget.otherProfilePicture,
                                myUserName: widget.myUserName,
                                otherUserName: widget.otherUserName,
                                myUserId: widget.myUserId,
                                otherUserId: widget.otherUserId,
                                replyTo: '',
                                text: _textController.text,
                                image: [],
                                myToken: '',
                                otherToken: '');
                            setState(() {
                              _textController.clear();
                            });

                          },
                          color: NeedlincColors.blue1,
                        ),
                      ],
                    ),
                  ),
                ),

                //Calendar feature and properties
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Set_appointment()));
                        }, //  TODO: Implement an action
                        color: NeedlincColors.blue1
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//