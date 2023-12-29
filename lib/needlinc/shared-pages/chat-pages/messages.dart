import "package:flutter/material.dart";
import "package:needlinc/needlinc/colors/colors.dart";
import 'package:needlinc/needlinc/shared-pages/chat-pages/chat_screen.dart';

// TODO: Creating a message class
class MessageTab {
  String sender;
  String newMessage;
  int messageCount;
  String senderPic;
  MessageTab({this.sender = "NeedLinc",
    this.newMessage = "NeedLinc is here to revolutionalize. Anticipate!!!!!!!!!",
    this.messageCount=0,
    this.senderPic = "assets/logo.png"});
}



class Message extends StatefulWidget {
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  List<MessageTab> MessageTabs = [
    MessageTab(messageCount: 1),
    MessageTab(messageCount: 3),
    MessageTab(messageCount: 2),
    MessageTab(),
    MessageTab(),
    MessageTab(),
    MessageTab()
  ]; // Created list of MessageTabs of data type MessageTab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 20,
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          "MESSAGES",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 12
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, iconSize: 25, icon: Icon(Icons.more_vert))
        ],
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          //TODO Search bar
          Container(
            height: 26,
            width: 400,
            margin: EdgeInsets.only(left: 50, right: 50),
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: NeedlincColors.black3,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.search, color: NeedlincColors.blue1,),
                SizedBox(width: 1),
                VerticalDivider(thickness: 2,),
                SizedBox(width: 1),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      // TODO: Perform search action here
                      // For simplicity, you can just print a message for now
                      print('Performing search for: $value');
                    },
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top:40),
            child: ListView.builder(
                itemCount: MessageTabs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPage()));
                        },
                        leading: CircleAvatar(child: Image.asset("assets/logo.png"), radius: 25),
                        title: Text(
                          "${MessageTabs[index].sender}",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "${MessageTabs[index].newMessage}",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: MessageTabs[index].messageCount > 0 ? Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: NeedlincColors.blue1,
                          ),
                          child: Center(
                            child: Text(
                                "${MessageTabs[index].messageCount}",
                                style: TextStyle(fontWeight: FontWeight.w600, color: NeedlincColors.white )),
                          ),
                        )
                            :
                        null,
                      ),
                      Divider(thickness: 1.2, color:NeedlincColors.black2),
                    ],
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}