import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/client-pages/marketplace.dart';
import '../colors/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      drawer: Drawer(
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
      //TODO(Already done) This is the AppBar
      appBar: AppBar(
          backgroundColor: NeedlincColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: NeedlincColors.blue1),
          title: Center(child: Text("Needlinc", style: TextStyle(fontSize: 15,color: NeedlincColors.blue1),)),
          actions: [IconButton(
            padding: EdgeInsets.symmetric(horizontal: 10),
            icon: Icon(Icons.message),
            onPressed: (){
              //TODO Chat messaging feature
            },
          ),]
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO Search bar
                  Container(
                    height: 40,
                    width: 400,
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
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
            //TODO Write a post section
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 12.0),
              color: NeedlincColors.black3,
            child: Column(
              children: [
                Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.all(10.0),
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
                      Padding(padding: EdgeInsets.all(8), child: Text("Write A Post"),)
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 50.0,),
                    IconButton(onPressed: (){}, icon: Icon(Icons.photo_library_outlined, color: NeedlincColors.blue1,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined, color: NeedlincColors.blue1,))
                  ],
                )
              ],
             ),
            ),
            //TODO Individual post
            Container(
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
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border, size: 22,)),
                          Text("1.2K", style: TextStyle(fontSize: 10))
                        ],
                      ),
                      SizedBox(width: 10.0,),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined, size: 20,)),
                          Text("200", style: TextStyle(fontSize: 10))
                        ],
                      ),
                      SizedBox(width: 10.0,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.bookmark_border, size: 20,)),
                      SizedBox(width: 10.0,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.share,size: 20,))
                    ],
                  )
                ],
              ),
            ),
          ]
        ),
      )
    );
  }
}
