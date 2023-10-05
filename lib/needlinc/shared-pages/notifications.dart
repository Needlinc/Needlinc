import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.blue,
        title: Text(
            "NOTIFICATION",
          style: TextStyle(
            //color: Colors.blue,
            fontSize: 14,
          ),
        ),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert)
        ),
      ],
        elevation: 0.0,

      ),
      body: Center(child: Text("No Notifications here"),),
    );
  }
}
