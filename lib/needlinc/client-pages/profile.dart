import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
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
              child: Stack(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(
                  //         "assets/1.png",
                  //       ),
                  //       fit: BoxFit.fill,
                  //     ),
                  //     color: Colors.blue,
                  //     shape: BoxShape.rectangle,
                  //   ),
                  // ),
                  //TODO Blurred overlay using BackdropFilter
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      color: NeedlincColors.blue2.withOpacity(0.5),
                      width: 0.001,
                      height: 0.001,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: NeedlincColors.blue3,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Emeka John", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                                  Container(color: NeedlincColors.black2, width: 180, height: 2.0, margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: NeedlincColors.blue2,),
              title: Text('Settings', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))},
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.input, color: NeedlincColors.blue2,),
                title: Text('Back to Home', style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()))}
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined, color: NeedlincColors.blue2,),
              title: Text('Marketplace', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people_outline, color: NeedlincColors.blue2),
              title: Text('Freelancers', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications, color: NeedlincColors.blue2,),
              title: Text('Notifications', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline, color: NeedlincColors.blue2,),
              title: Text('Profile', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.question_mark, color: NeedlincColors.blue2,),
              title: Text('FAQs/Help', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.headset_mic, color: NeedlincColors.blue2,),
              title: Text('Contact Us', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text("Sign Out/Log Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, decoration: TextDecoration.underline,),),
              ),
            )
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Emeka John",
                      style: GoogleFonts.dosis(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      "070 8786 0987",
                      style: GoogleFonts.arimo(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      "debra.holt@example.com",
                      style: GoogleFonts.arimo(
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
                      borderRadius: BorderRadius.circular(10.0),
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
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Account Information",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Your Posts",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Saved & Favourited",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Contracts",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Transaction History",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Privacy Settings",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Reviews/Ratings",
                    style: GoogleFonts.oxygen(
                      fontSize: 20,
                      color: Colors.blue[300],
                    ),
                  ),
                 ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Help/Support",
                      style: GoogleFonts.oxygen(
                        fontSize: 20,
                        color: Colors.blue[300],
                      ),
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
