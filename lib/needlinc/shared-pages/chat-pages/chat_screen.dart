import 'package:flutter/material.dart';
import "package:grouped_list/grouped_list.dart";
import "package:intl/intl.dart";
import "package:needlinc/needlinc/colors/colors.dart";
import "package:needlinc/needlinc/shared-pages/chat-pages/set_appointment.dart";


class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

final TextEditingController _textController = TextEditingController(); //text controller parameter for the message field
int numberOfLines = _textController.text.split("\n").length;
class _MainPageState extends State<MainPage> {
  List<Message> messages = [
    Message(
        text: "Needlinc app is the best",
        date: DateTime.now().subtract(Duration(minutes: 13)),
        isMe: false
    ),
    Message(
        text: "Needlinc app is the best",
        date: DateTime.now().subtract(Duration(minutes: 14)),
        isMe: false
    ),
    Message(
        text: "Needlinc app is the best",
        date: DateTime.now().subtract(Duration(minutes: 15)),
        isMe: true
    ),
    Message(
        text: "Needlinc app is the best",
        date: DateTime.now().subtract(Duration(minutes: 16)),
        isMe: false
    ),
    Message(
        text: "Needlinc app is the best",
        date: DateTime.now().subtract(Duration(minutes: 17)),
        isMe: true
    ),
    Message(
        text: "Needlinc app is the best",
        date: DateTime.now().subtract(Duration(minutes: 18)),
        isMe: true
    ),
  ];
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
            child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day
                ),
                groupHeaderBuilder: (Message message) =>  SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: NeedlincColors.blue2,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style:  const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                    alignment: message.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: message.isMe == true ? Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(message.text),
                      ),
                    )
                        :
                    Card(
                      elevation: 8,
                      color: NeedlincColors.blue3,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(message.text),
                      ),
                    )

                )
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
                              final message = Message(
                                text: text,
                                date: DateTime.now(),
                                isMe: true,
                              );
                              setState(() {
                                messages.add(message);
                                _textController.clear();
                              });
                            },
                          ),
                        ),

                        //Send button in the message field
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            final text = _textController.text;
                            if (text.isNotEmpty) {
                              final message = Message(
                                text: text,
                                date: DateTime.now(),
                                isMe: true,
                              );
                              setState(() {
                                messages.add(message);
                                _textController.clear();
                              });
                            }
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
    ) ;
  }
}

//Message class
class Message {
  final String text;
  final date;
  final isMe;

  Message({
    required this.text,
    required this.date,
    required this.isMe,
  });
}