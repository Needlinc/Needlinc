import "package:cloud_firestore/cloud_firestore.dart";
import 'package:flutter/material.dart';
import "package:grouped_list/grouped_list.dart";
import "package:intl/intl.dart";
import "package:needlinc/needlinc/colors/colors.dart";
import "package:needlinc/needlinc/shared-pages/chat-pages/set_appointment.dart";

import "../../backend/user-account/upload-chat.dart";


class ChatScreen extends StatefulWidget {
  final String myUserId;
  final String otherUserId;
  final String myUserName;
  final String otherUserName;

  // Add a constructor to ChatScreen that takes userId as a parameter
  ChatScreen({
    Key? key,
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



  @override
  Widget build(BuildContext context) {
    // Stream for listening to messages
    Stream<QuerySnapshot> messageStream = FirebaseFirestore.instance
        .collection('chats')
        .doc("${widget.myUserId}${widget.otherUserId}")
        .collection('${widget.myUserId}${widget.otherUserId}')
        .orderBy('timestamp', descending: true)
        .snapshots();
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
                  return Text("User not found");
                }

                var userDocument = snapshot.data!;
                // Here, you can use `userDocument` to get user-specific data
                // For demonstration, let's assume 'messages' is a field in the user document
                // var messages = userDocument['messages'] as List<Message>;

                // Dummy messages list (replace this with data from Firestore)


                return Container(

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
                    width: MediaQuery.of(context).size.width * 0.66,
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
                              sendMessage(myUserName: widget.myUserName, otherUserName: widget.otherUserName, myUserId: widget.myUserId, otherUserId: widget.otherUserId, replyTo: '', text: _textController.text, image: [], recipientToken: '');
                              print(widget.myUserName);
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

                            sendMessage(myUserName: widget.myUserName, otherUserName: widget.otherUserName, myUserId: widget.myUserId, otherUserId: widget.otherUserId, replyTo: '', text: _textController.text, image: [], recipientToken: '');
                            print(widget.myUserName);
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