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
        title: const Text(
            "NOTIFICATION",
          style: TextStyle(
            //color: Colors.blue,
            fontSize: 14,
          ),
        ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 2),
          child: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      ],
        elevation: 0.0,

      ),
      body: NotificationView()
    );
  }
}
// Create a custom class
class Notification {
  String? notification;
  String? date;
  String? time_diff;
  Notification({this.notification, this.date, this.time_diff});
}

//Use the custom class to create a custom custom widget
class NotificationView extends StatelessWidget {
final List<Notification> Notifications = [
Notification(
notification: "You Just set an appointment with JOHN DOE an electrician by 7:30 on Thursday.",
date: "Today",
time_diff: "Now"
),

Notification(
notification: "Hurray! Enjoy a special discount of 30% on Iphone 11 for sale on Marketplace. Valid for 3 weeks.",
date: "Today",
    time_diff: "3h"
),
Notification(
notification: "your post on Marketplace hs received 12 reactions.Check out the engagement",
date: "Yesterday",
time_diff: "1d"
),
Notification(
notification: "Congratulations! Your account has been successfully created.Start exploring NEEDLINC now!",
date: "Yesterday",
    time_diff: "1d"
),
Notification(
notification: "Welcome to NEEDLINC! Get ready to explore and enjoy our app's exciting service and features",
date: "Yesterday",
    time_diff: "1d"
)
];


@override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Notifications.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                onTap: (){},
                title: Text(
                  "${Notifications[index].notification}",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                    "${Notifications[index].time_diff}",
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),

        );
      }
    );
  }
}

