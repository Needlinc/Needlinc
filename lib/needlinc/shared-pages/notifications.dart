import 'package:flutter/material.dart';
import 'dart:ui';


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
        Container(
          margin: EdgeInsets.only(right: 2),
          child: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      ],
        elevation: 0.0,

      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 11),
            child: Text(
                "Today",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
          ListTile(
            title: Text("${Notifications[0][0]??"No messages found"}"),
            trailing: Text(
              "Nov",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Handle tap on Item 2
            },
          ),
        ],
      ),
    );
  }
}

List<List> Notifications = [[
  "You Just set an appointment with JOHN DOE an electrician by 7:30 on Thursday",
  "Hurrray! Enjoy a special discount of 30% on Iphone 11 for sale on Marketplace. Valid for 3 weeks."
  ],
  ["your post on Markertplace hs recerived 12 reactions.Check out the engagement",
  "Congratulations! Your account has been successfully created.Start exploring NEEDLINC now!",
  "Welcome to NEEDLINC! Get ready to explore and enjoy our app's exciting service and features"
]];