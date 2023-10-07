import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/colors.dart';
import 'business-main.dart';

class ClientToFreelancer extends StatefulWidget {
  const ClientToFreelancer({Key? key}) : super(key: key);

  @override
  State<ClientToFreelancer> createState() => _ClientToFreelancerState();
}

class _ClientToFreelancerState extends State<ClientToFreelancer> {
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
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 4)));
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
             // onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()))},
            ),
            Divider(),
            ListTile(
                leading: Icon(Icons.input, color: NeedlincColors.blue2,),
                title: Text('Back to Home', style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 0)))}
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined, color: NeedlincColors.blue2,),
              title: Text('Marketplace', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 1)))},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.people_outline, color: NeedlincColors.blue2),
              title: Text('Freelancers', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 2)))},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications, color: NeedlincColors.blue2,),
              title: Text('Notifications', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 3)))},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person_outline, color: NeedlincColors.blue2,),
              title: Text('Profile', style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 4)))},
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
      //TODO(Already done) This is the AppBar
      appBar: AppBar(
          backgroundColor: NeedlincColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: NeedlincColors.blue1),
          title: Container(
              margin: EdgeInsets.only(left: 60.0),
              child: Text("Jobs for You", style: TextStyle(fontSize: 15,color: NeedlincColors.blue1),)
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  icon: Icon(Icons.people),
                  onPressed: (){
                    //TODO Chat messaging feature
                  },
                ),
                IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  icon: Icon(Icons.message),
                  onPressed: (){
                    //TODO Chat messaging feature
                  },
                ),
              ],
            ),
          ]
      ),
      //TODO Body
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
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
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 50.0, left: 10.0),
              child: Text(
                  "Pending Jobs",
                style: GoogleFonts.oxygen(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.6, left: 10.0),
              child: Divider(
                color: NeedlincColors.blue2,
              ),
            ),
            //TODO Cards section
            Container(
              height: 135.0,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11, left: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [
                  //TODO Appointment Cards
                  for(int i = 0; i < 5; i++)
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.all(8.0),
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: NeedlincColors.blue2,
                      )
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TODO Profile picture for Pending appointments
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 4)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 45.0),
                                padding: EdgeInsets.all(50.0),
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow"),
                                    fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)
                                ),
                              ),
                            ),
                            //TODO Time registered for appointment
                            Container(
                              width: 200,
                              margin: EdgeInsets.only(left: 5.0),
                              child: Text(
                                  "You have an appointment with Emeka John by 7:30pm on Friday 12th",
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                        //TODO The two buttons underneath the appointment cards
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(6.5),
                              margin: EdgeInsets.only(left: 65.0,),
                              child: Text(
                                  'Cancel',
                                style: TextStyle(
                                  color: NeedlincColors.blue2
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: NeedlincColors.grey,
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 75.0,),
                              child: Text(
                                  "Edit",
                                style: TextStyle(
                                    color: NeedlincColors.blue2,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3, left: 10.0),
              child: Divider(
                color: NeedlincColors.blue2,
              ),
            ),
            //TODO The text "Just for you"
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.315, left: 10.0),
              child: Text(
                "Jobs For You",
                style: GoogleFonts.oxygen(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            //TODO List of Client Post just for your type of expertise
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35, left: 10.0),
              child: ListView(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                children: [
                  //TODO Appointment Card
                  for(int i = 0; i < 5; i++)
                    Container(
                      margin: EdgeInsets.only(right: 20.0, bottom: 10.0),
                      padding: EdgeInsets.all(8.0),
                      height: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: NeedlincColors.blue2,
                          )
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //TODO Profile picture for Pending appointments
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BusinessMainPages(currentPage: 4)));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 45.0),
                                  padding: EdgeInsets.all(50.0),
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage("https://tpc.googlesyndication.com/simgad/9072106819292482259?sqp=-oaymwEMCMgBEMgBIAFQAVgB&rs=AOga4qn5QB4xLcXAL0KU8kcs5AmJLo3pow"),
                                          fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.circular(30.0)
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  //TODO Identity Info.
                                  Container(
                                    width: 200,
                                    margin: EdgeInsets.only(left: 5.0, bottom: 8.0),
                                    child: Text(
                                      "John Doe just posted a Job",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  //TODO Time registered for appointment
                                  Container(
                                    width: 200,
                                    margin: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      "You have an appointment with Emeka John by 7:30pm on Friday 12th",
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                              Text("🟢 Now", style: TextStyle(fontSize: 9)),
                            ],
                          ),
                          //TODO The two buttons underneath the appointment cards
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(6.5),
                                margin: EdgeInsets.only(left: 65.0,),
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                      color: NeedlincColors.white
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: NeedlincColors.blue1,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
