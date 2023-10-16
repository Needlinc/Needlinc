import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../backend/authentication/logout.dart';
import '../colors/colors.dart';
import 'client-main.dart';

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
        actions: [
          // TODO Drop down menu for Profile page
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                showDragHandle: true,
                enableDrag: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)
                  )
                ),
                  context: context,
                  builder: (BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))
                      ),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.settings, color: NeedlincColors.blue2,),
                            title: Text('Settings', style: TextStyle(color: NeedlincColors.blue2)),
                            onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RootPage()))},
                          ),
                          Divider(),
                          ListTile(
                              leading: Icon(Icons.input, color: NeedlincColors.blue2,),
                              title: Text('Back to Home', style: TextStyle(color: NeedlincColors.blue2)),
                              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 0)))}
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.shopping_cart_outlined, color: NeedlincColors.blue2,),
                            title: Text('Marketplace', style: TextStyle(color: NeedlincColors.blue2)),
                            onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 1)))},
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.people_outline, color: NeedlincColors.blue2),
                            title: Text('Freelancers', style: TextStyle(color: NeedlincColors.blue2)),
                            onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 2)))},
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.notifications, color: NeedlincColors.blue2,),
                            title: Text('Notifications', style: TextStyle(color: NeedlincColors.blue2)),
                            onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 3)))},
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.person_outline, color: NeedlincColors.blue2,),
                            title: Text('Profile', style: TextStyle(color: NeedlincColors.blue2)),
                            onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 4)))},
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
                            child: GestureDetector(
                              onTap: (){
                                signOutUser();

                                  Navigator.of(context).pushNamedAndRemoveUntil('//', (route) => false);

                              },
                              child: Container(
                                padding: EdgeInsets.all(20.0),
                                child: Text("Sign Out/Log Out", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600, decoration: TextDecoration.underline,),),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
              );
            },
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.menu)
              )
          )
        ],
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
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Account Information",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Your Posts",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Saved & Favourited",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Contracts",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Transaction History",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Privacy Settings",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
                        color: Colors.blue[300],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                  child: Text(
                    "Reviews/Ratings",
                    style: GoogleFonts.oxygen(
                      fontSize: 16,
                      color: Colors.blue[300],
                    ),
                  ),
                 ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Help/Support",
                      style: GoogleFonts.oxygen(
                        fontSize: 16,
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
