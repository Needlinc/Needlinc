import 'package:flutter/material.dart';
import '../colors/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Side menu',
                style: TextStyle(color: NeedlincColors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cover.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text('Welcome'),
              onTap: () => {Navigator.of(context).pop},
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: NeedlincColors.blue1),
        title: Text(
          "Emeka John",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 13,
          ),
        ),
        backgroundColor: NeedlincColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(40),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                      ),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emeka John",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "070 8786 0987",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "debra.holt@example.com",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 130,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Edit Profile"),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(NeedlincColors.blue1),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account Information",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Your Posts",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Saved & Favourited",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Contracts",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Transaction History",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Privacy Settings",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Reviews/Ratings",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Help/Support",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
