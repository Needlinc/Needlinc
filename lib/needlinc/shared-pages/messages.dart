import "package:flutter/material.dart";
import "package:needlinc/needlinc/colors/colors.dart";


class Message extends StatefulWidget {
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
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
          //TODO Search bar(ALready done)
          Container(
          height: 25,
          width: 400,
          margin: EdgeInsets.only(left: 60.0, right: 60.00),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: NeedlincColors.black3,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: <Widget>[
              Icon(Icons.search),
              SizedBox(width: 2),
              VerticalDivider(thickness: 2,),
              SizedBox(width: 4),
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
          margin: EdgeInsets.only(top: 50),
            child: MessagesTabs()
        ),

    ],
    ),
    floatingActionButton: FloatingActionButton(
          onPressed: () {},
        mini: true,
        elevation: 6.0,
          backgroundColor: NeedlincColors.blue1,
          child: Center(child: Text("+", style: TextStyle(color: NeedlincColors.white, fontSize: 35),))
      ),
    );
  }
}
// TODO: Add a new parameter for the number of new messages
class Chat {
  String? newMessage;
  String? sender;
  String? senderPic;
  int messageCount;
  Chat({this.newMessage, this.sender, this.senderPic, this.messageCount = 0});
}


//TODO: create a MessagesTabs widgets(Already done)
class MessagesTabs extends StatefulWidget {
  const MessagesTabs({Key? key}) : super(key: key);
  @override
  State<MessagesTabs> createState() => _MessagesTabsState();
}

class _MessagesTabsState extends State<MessagesTabs> {
  List<Chat> Chats = [
    Chat(
        newMessage: "We are the needlincers here to connect you to your need ranging human services to delivery of goods.",
        sender: "McSaint Ebolom",
        senderPic: "assets/logo.png",
        messageCount: 3
    ),
    Chat(
        newMessage: "We are the needlincers here to connect you to your need ranging human services to delivery of goods.",
        sender: "Soma",
        senderPic: "assets/logo.png",
      messageCount: 1
    ),
    Chat(
      newMessage: "We are the needlincers here to connect you to your need ranging human services to delivery of goods.",
        sender: "Richard",
        senderPic: "assets/logo.png",
        messageCount: 1
    ),
    Chat(
        newMessage: "We are the needlincers here to connect you to your need ranging human services to delivery of goods.",
        sender: "DMKart100",
        senderPic: "assets/logo.png",
        messageCount: 0
      ),
    Chat(
        newMessage: "We are the needlincers here to connect you to your need ranging human services to delivery of goods.",
        sender: "Bobby",
        senderPic: "assets/logo.png",
        messageCount: 0
    ),
    Chat(
        newMessage: "We are the needlincers here to connect you to your need ranging human services to delivery of goods.",
        sender: "Yucci",
        senderPic: "assets/logo.png",
        messageCount: 0
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Chats.length,
      itemBuilder: (context, index){
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                child: Image.asset("assets/logo.png"),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${Chats[index].sender}", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    "${Chats[index].newMessage}", overflow: TextOverflow.ellipsis, maxLines: 2,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),

              // Conditional statement to display the message count widget
              trailing: Chats[index].messageCount > 0 ? Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(color: NeedlincColors.blue1,borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                  child: Text(
                    Chats[index].messageCount.toString(),
                    style: TextStyle(color: NeedlincColors.white),
                  ),
                )
              )
              :
             Container(width:0.0, height: 0.0),
              onTap: () {},
            ),
            Divider(color: Colors.grey, thickness: 1,)
          ],
        );
      }
    );
  }
}

