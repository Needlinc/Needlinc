import 'dart:ui';
import 'package:flutter/material.dart';
import '../freelancer-pages/post.dart';
import 'package:needlinc/needlinc/freelancer-pages/freelancer-main.dart';
import 'package:needlinc/needlinc/shared-pages/comments.dart';
import '../../main.dart';
import '../colors/colors.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 120,
              child: DrawerHeader(
                child: Stack(
                  children: [
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
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 4)));
                                },
                                child: Container(
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
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Richard John", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
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
            ),
            ListTile(
              leading: Icon(Icons.settings, color: NeedlincColors.blue2,),
              title: Text('Settings', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))},
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.input, color: NeedlincColors.blue2,),
                title: Text('Back to Home', style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 0)))}
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined, color: NeedlincColors.blue2,),
              title: Text('Marketplace', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 1)))},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people_outline, color: NeedlincColors.blue2),
              title: Text('Freelancers', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 2)))},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications, color: NeedlincColors.blue2,),
              title: Text('Notifications', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 3)))},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline, color: NeedlincColors.blue2,),
              title: Text('Profile', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 4)))},
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
          ],
        ),
      ),
      // TODO(Already done) This is the AppBar
      appBar: AppBar(
          backgroundColor: NeedlincColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: NeedlincColors.blue1),
          title: Column(
            children: [
              Center(child: Text("MARKET PLACE", style: TextStyle(fontSize: 15,color: Colors.blue),)),
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                height: 15,
                width: 100,
                decoration: BoxDecoration(
                  color: NeedlincColors.black3,
                  borderRadius: BorderRadius.circular(20)
                ),
              )
            ],
          ),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.message),
                    onPressed: (){
                      //TODO Chat messaging feature
                    },
                   ),
                    //TODO This container is for the small circular profile  picture  at the app bar in the market place page
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 4)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
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
                    ),
                  ],
                ),
                //TODO This is the post button in the market-place page
                Container(
                  width: 45,
                  height: 40,
                  decoration: BoxDecoration(
                    color: NeedlincColors.blue1,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: NeedlincColors.black2.withOpacity(0.8), // Shadow color
                        spreadRadius: 4, // Spread radius
                        blurRadius: 5, // Blur radius
                        offset: Offset(0, 6), // Offset in the form of (dx, dy)
                      ),
                    ],
                  ),
                  child: IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    icon: Icon(Icons.draw_outlined, color: NeedlincColors.white,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        toolbarHeight: 95,
      ),
      body: SingleChildScrollView(
        child:  Column(
          children: [
            SizedBox(child: Divider(thickness: 2, color: NeedlincColors.black2,), width: MediaQuery.of(context).size.width * 0.95,),
            for(int newsPost = 0; newsPost < 16; newsPost++)
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 6.0),
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
              decoration: BoxDecoration(
                color: NeedlincColors.white,
                boxShadow: [
                  BoxShadow(
                    color: NeedlincColors.black3.withOpacity(0.8), // Shadow color
                    spreadRadius: 4, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 6), // Offset in the form of (dx, dy)
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FreelancerMainPages(currentPage: 4)));
                        },
                        child: Container(
                          padding: EdgeInsets.all(25),
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
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "John Doe",
                                  style: TextStyle(
                                      fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "🟢 Now",
                                  style: TextStyle(fontSize: 9),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.more_horiz))
                              ],
                            ),
                            Text("~Electrician",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600)),
                            Text("📍John Paul's kitchen, eziobodor",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: NeedlincColors.black2))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 10.0),
                    child: Text(
                        "Second hand HP Laptop for sale going for #85,000",
                        style: TextStyle(fontSize: 18)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.55,
                    margin: EdgeInsets.fromLTRB(70.0, 0.0, 10.0, 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow",
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: NeedlincColors.black3,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border, size: 22)),
                          Text("1.2K", style: TextStyle(fontSize: 10))
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage()));
                              },
                              icon: Icon(Icons.maps_ugc_outlined, size: 20)),
                          Text("500", style: TextStyle(fontSize: 10))
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_border, size: 20)),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.shopping_cart_outlined, size: 22)),
                      SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.share, size: 20))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}