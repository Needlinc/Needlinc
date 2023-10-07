import "package:flutter/material.dart";


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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: true,
              actions: [
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.blue ,
                      border: OutlineInputBorder()
                  ),
                ),
              ],
            ),
          ]
        ),
    );
  }
}

