import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/backend/user-account/functionality.dart';
import 'package:needlinc/needlinc/shared-pages/contracts.dart';
import 'package:needlinc/needlinc/shared-pages/edit-profile.dart';
import 'package:needlinc/needlinc/shared-pages/reviews_ratings.dart';
import 'package:needlinc/needlinc/shared-pages/saved_post.dart';
import 'package:needlinc/needlinc/shared-pages/settings.dart';
import '../../main.dart';
import '../backend/authentication/logout.dart';
import '../colors/colors.dart';
import '../shared-pages/auth-pages/welcome.dart';
import 'client-main.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bottomMenuBar() {
    showModalBottomSheet(
        showDragHandle: true,
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                 ListTile(
                  title: Text('Settings',
                      style: TextStyle(color: Colors.black)),
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));},
                ),
                const Divider(),
                ListTile(
                    title: const Text('Contracts',
                        style: TextStyle(color: Colors.black)),
                    onTap: () => {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Contracts()))
                        }),
                const Divider(),
                ListTile(
                  title: const Text('Saved',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Saved_Post()))
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Reviews/Ratings',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    // TODO: Implement the Revew/Ratings actions
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Reviews_Ratings()))
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Contact Us',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    // TODO: Implement the Contact Us page and its action
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Help',
                      style: TextStyle(color: Colors.black)),
                  onTap: () => {
                    //TODO: Implement the Help page and it's page
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text('Log out',
                      style: TextStyle(color: Colors.red)),
                  onTap: () => {Navigator.of(context).pop()},
                ),
                const Divider()
              ],
            ),
          );
        });
  }




  Widget SlideingPages({required String userCategory, required String userId}) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          if (screenView == "post")
            Center(
              child: Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('homePage')
                      .where('userDetails.userId', isEqualTo: userId)
                      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: const Text("Something went wrong"));
                    }
                    if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
                      List<DocumentSnapshot> dataList = snapshot.data!.docs;
                      var data;
                      List<Widget> postsList = [];

                      for (int index = 0; index < dataList.length; index++) {
                        data = dataList[index].data() as Map<String, dynamic>;
                        Map<String, dynamic>? userDetails = data['userDetails'];
                        Map<String, dynamic>? postDetails = data['postDetails'];

                        if (userDetails == null || postDetails == null) {
                          postsList.add(Center(child: const Text("User details not found")));
                        } else {
                          // Cast images list to List<String>
                          List<String> images = List<String>.from(postDetails['images']);

                          // Add the homePage widget to the list
                          postsList.add(homePage(text: postDetails['writeUp'], picture: images));
                        }
                      }

                      return Column(
                        children: postsList,
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return const WelcomePage();
                  },
                ),
              ),
            )
          else
            Center(
              child: Container(
                child: Text('MarketPlace'),
              ),
            ),
        ],
      ),
    );
  }





  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? userId;
  static bool isBlogger = true;
  bool isBroadcast = true;
  bool isPosts = !isBlogger;
  bool isMarketPlace = false;
  Color? postColor;
  Color? marketPlaceColor;
  String screenView = "post";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        title: Row(
          children: [
            const Text(
              '',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13,
              ),
            ),
           // if (isBlogger) const Icon(Icons.mic, size: 16)
          ],
        ),
        actions: [
        //  TODO Drop down menu for Profile page
          if (true)
            InkWell(
              onTap: bottomMenuBar,
              child: Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: const Icon(Icons.menu_sharp),
              ),
            )
        ],
        backgroundColor: NeedlincColors.white,
        elevation: 0,
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users') // Replace with your collection name
              .doc('${_auth.currentUser!.uid}') // Replace with your document ID
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: const Text("Something went wrong"));
            }
            if (snapshot.connectionState == ConnectionState.active || snapshot.connectionState == ConnectionState.done) {
              var userData = snapshot.data?.data() as Map<String, dynamic>;
              return Stack(
                children: [
                  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Profile Picture
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          "${userData['profilePicture']}",
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  // Name and profile details
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                             '${userData['userName']}',
                                            style: GoogleFonts.dosis(
                                                fontWeight: FontWeight.w600, fontSize: 16),
                                          ),
                                          if (isBlogger) Icon(Icons.mic, size: 22)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "${userData['phoneNumber']}",
                                        style: GoogleFonts.arimo(
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        "${userData['email']}",
                                        style: GoogleFonts.arimo(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            // message or edit button
                            ElevatedButton(
                              onPressed: () {
                                if (userData['userId'] == _auth.currentUser!.uid) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const editProfile()));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                backgroundColor: NeedlincColors.blue1,
                                padding:
                                const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                              ),
                              child: Text(
                                 'Edit Profile',
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {

                                      setState(() {
                                        postColor = NeedlincColors.blue1;
                                        marketPlaceColor = NeedlincColors.black1;
                                        screenView = "post";
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: marketPlaceColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        userData['userCategory'] == 'Blogger' ? 'News Post' : 'Home Post',
                                        style: TextStyle(
                                          color: postColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {

                                      setState(() {
                                        postColor = NeedlincColors.black1;
                                        marketPlaceColor = NeedlincColors.blue1;
                                        screenView = "marketPlace";
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: postColor,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        'MarketPlace',
                                        style: TextStyle(
                                          color: marketPlaceColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                      ]
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 220.0),
                      child: SlideingPages(userCategory: userData['userCategory'], userId: _auth.currentUser!.uid),
                  )
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return const WelcomePage();
          },
        ),
      ),
    );
  }
}
















Widget homePage ({required String text, required List<String> picture}){
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          color: NeedlincColors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text != null ? Text(text) : Text(""),
              const SizedBox(height: 8),
              picture != null ?
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(picture[0]),
                    ),
                  ),
                )
              :
              Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(""),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: NeedlincColors.red,
                        ),
                      ),
                      const Text('400'),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.maps_ugc_outlined),
                      ),
                      const Text('400'),
                    ],
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark, color: Colors.amber[300]),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
}