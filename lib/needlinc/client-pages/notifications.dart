import 'package:flutter/material.dart';

import '../colors/colors.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                      ),
                      fit: BoxFit.fill,
                    ),
                    color: NeedlincColors.black3,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("John Doe", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          Text("🟢 Now", style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
                        ],
                      ),
                      Text("~Electrician", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                      Text("📍John Paul's kitchen, eziobodor", style: TextStyle(fontSize: 12, color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
