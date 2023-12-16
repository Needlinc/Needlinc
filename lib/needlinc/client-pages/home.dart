import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/shared-pages/auth-pages/welcome.dart';
import 'package:needlinc/needlinc/shared-pages/home-post.dart';
import 'package:needlinc/needlinc/shared-pages/comments.dart';
import 'package:needlinc/needlinc/client-pages/client-main.dart';
import 'package:needlinc/needlinc/shared-pages/messages.dart';
import '../colors/colors.dart';
import '../shared-pages/news.dart';
import '../widgets/page-transition.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  CollectionReference homePage = FirebaseFirestore.instance.collection('homePage');

// Get The post data from the HomePost widget and send it to the screen for users to view
  Widget displayHomePosts({
    required BuildContext context,
    required String userName,
    required String address,
    required String userCategory,
    required String profilePicture,
    required String image,
    required String writeUp,
    required double hearts,
    required List comments,
    required int timeStamp
  }){
    if(image != "null" && writeUp != "null"){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 4),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          profilePicture,
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: NeedlincColors.black3,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(userName, style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          Text("🟢 Now",
                              style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: () {},
                              icon: Icon(Icons.more_horiz))
                        ],
                      ),
                      Text(userCategory, style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                      Text("📍${address}", style: TextStyle(
                          fontSize: 12,
                          color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 65, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text(
                writeUp,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.55,
              margin: EdgeInsets.fromLTRB(70.0, 0.0, 10.0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
                color: NeedlincColors.black3,
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border, size: 22,)),
                    Text("$hearts", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              CommentsPage()));
                    },
                        icon: Icon(
                          Icons.maps_ugc_outlined, size: 20,)),
                    Text("${comments.length}", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border, size: 20,)),
                SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.share, size: 20,))
              ],
            )
          ],
        ),
      );
    }
    if(image != "null" && writeUp == "null"){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 4),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          profilePicture,
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: NeedlincColors.black3,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(userName, style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          Text("🟢 Now",
                              style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: () {},
                              icon: Icon(Icons.more_horiz))
                        ],
                      ),
                      Text(userCategory, style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                      Text("📍${address}", style: TextStyle(
                          fontSize: 12,
                          color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.55,
              margin: EdgeInsets.fromLTRB(70.0, 0.0, 10.0, 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
                color: NeedlincColors.black3,
                shape: BoxShape.rectangle,
              ),
            ),
            SizedBox(height: 30.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border, size: 22,)),
                    Text("$hearts", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              CommentsPage()));
                    },
                        icon: Icon(
                          Icons.maps_ugc_outlined, size: 20,)),
                    Text("${comments.length}", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border, size: 20,)),
                SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.share, size: 20,))
              ],
            )
          ],
        ),
      );
    }
    if(image == "null" && writeUp != "null"){
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
        color: NeedlincColors.white,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 4),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          profilePicture,
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: NeedlincColors.black3,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(userName, style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          Text("🟢 Now",
                              style: TextStyle(fontSize: 9)),
                          IconButton(onPressed: () {},
                              icon: Icon(Icons.more_horiz))
                        ],
                      ),
                      Text(userCategory, style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                      Text("📍${address}", style: TextStyle(
                          fontSize: 12,
                          color: NeedlincColors.black2))
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 65, bottom: 10),
              alignment: Alignment.topLeft,
              child: Text(
                writeUp,
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border, size: 22,)),
                    Text('$hearts', style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              CommentsPage()));
                    },
                        icon: Icon(
                          Icons.maps_ugc_outlined, size: 20,)),
                    Text("${comments.length}", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_border, size: 20,)),
                SizedBox(width: 10.0,),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.share, size: 20,))
              ],
            )
          ],
        ),
      );
    }
    return Center(child: CircularProgressIndicator(),);
  }

  //Get Data from firebase and send it to the Display widget
  Widget HomePosts(BuildContext context){
    return Container(
        margin: EdgeInsets.only(top: 160.0),
        child: FutureBuilder<QuerySnapshot>(
          future: homePage.get(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              List<DocumentSnapshot> dataList = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = dataList[index].data() as Map<String, dynamic>;
                    Map<String, dynamic>? userDetails = data['userDetails'];
                    Map<String, dynamic>? productDetails = data['postDetails'];
                    if (userDetails == null) {
                      print(userDetails);
                      // Handle the case when userDetails are missing in a document.
                      return Text("User details not found");
                    }
                    if (productDetails == null) {
                      print(productDetails);
                      // Handle the case when userDetails are missing in a document.
                      return Text("User details not found");
                    }
                    if(userDetails['userCategory'] == 'null'){
                      return Center(
                        child: Text("There is a problem with your account, try reaching us via needlinc@gmail.com to help you out, we want to see that you have no problem trying to use needlinc to meet your needs, thank you...!"),
                      );
                    }
                    return displayHomePosts(
                      context: context,
                      userName: userDetails['userName'],
                      address: userDetails['address'],
                      userCategory: userDetails['userCategory'],
                      profilePicture: userDetails['profilePicture'],
                      image: productDetails['image'],
                      writeUp: productDetails['writeUp'],
                      hearts: 1.2,
                      comments: [],
                      timeStamp: productDetails['timeStamp'],
                    );
                  }
              );
            }
            // While waiting for the data to be fetched, show a loading indicator
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return WelcomePage();
          },
        )
    );
  }

  //TODO This is the POST to Homepage tab
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
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: NeedlincColors.blue3,
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) =>
                                            ClientMainPages(currentPage: 4)));
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
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text("Richard John", style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),),
                                      Container(color: NeedlincColors.black2,
                                        width: 180,
                                        height: 2.0,
                                        margin: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),)
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
                title: Text(
                    'Settings', style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()))
                },
              ),
              Divider(),
              ListTile(
                  leading: Icon(Icons.input, color: NeedlincColors.blue2,),
                  title: Text('Back to Home',
                      style: TextStyle(color: NeedlincColors.blue2)),
                  onTap: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ClientMainPages(currentPage: 0)))
                  }
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.shopping_cart_outlined, color: NeedlincColors.blue2,),
                title: Text('Marketplace',
                    style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 1)))
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                    Icons.people_outline, color: NeedlincColors.blue2),
                title: Text('Freelancers',
                    style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 2)))
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.notifications, color: NeedlincColors.blue2,),
                title: Text('Notifications',
                    style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 3)))
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.person_outline, color: NeedlincColors.blue2,),
                title: Text(
                    'Profile', style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ClientMainPages(currentPage: 4)))
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.question_mark, color: NeedlincColors.blue2,),
                title: Text(
                    'FAQs/Help', style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {Navigator.of(context).pop()},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.headset_mic, color: NeedlincColors.blue2,),
                title: Text('Contact Us',
                    style: TextStyle(color: NeedlincColors.blue2)),
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
            title: Center(child: Text("Needlinc",
              style: TextStyle(fontSize: 15, color: NeedlincColors.blue1),)),
            actions: [IconButton(
              padding: EdgeInsets.symmetric(horizontal: 10),
              icon: Icon(Icons.message),
              onPressed: () {
                //TODO Chat messaging feature(Already implemented UI)
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Message()),);
              },
            ),
            ]
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Stack(
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
                    height: 160,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          margin: EdgeInsets.only(top: 50, bottom: 10,),
                          decoration: BoxDecoration(
                            color: NeedlincColors.black3,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  //TODO Profile Picture
                                  GestureDetector(
                                    onTap: ()
                                    {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ClientMainPages(currentPage: 4)),);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      margin: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            data['profilePicture'],
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        color: NeedlincColors.black3,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  //TODO Write a post
                                  GestureDetector(
                                      onTap: ()
                                      {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePostPage()),);
                                      },
                                      child: Padding(padding: EdgeInsets.all(8), child: Text("Write a post..."),))
                                ],
                              ),
                              //TODO Select Gallary or Camera icon
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 50.0,),
                                  IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePostPage()));}, icon: Icon(Icons.photo_library_outlined, color: NeedlincColors.blue1,)),
                                  IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePostPage()));}, icon: Icon(Icons.camera_alt_outlined, color: NeedlincColors.blue1,))
                                ],
                              )
                            ],
                          ),
                        ),
                        //TODO (This is the News Icon close to the write a post page)
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, SizeTransition5(NewsPage()));
                          },
                          child: Container(
                            alignment: Alignment.topCenter,
                            height: 55,
                            margin: EdgeInsets.only(left: 16.0, right: 10.0, top: 48.0),
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: NeedlincColors.blue1,
                              boxShadow: [
                                BoxShadow(
                                  color: NeedlincColors.black2.withOpacity(0.6),
                                  spreadRadius: 2,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 6),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.newspaper, color: NeedlincColors.white, size: 30.0),
                                Text("News", style: TextStyle(color: NeedlincColors.white, fontSize: 10.0)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomePosts(context)
                ],
              );
            }

            // While waiting for the data to be fetched, show a loading indicator
            return Center(child: CircularProgressIndicator());
          },
        )
    );
  }
}