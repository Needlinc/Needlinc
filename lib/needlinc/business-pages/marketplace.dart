import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:needlinc/needlinc/business-pages/home.dart';
import 'package:needlinc/needlinc/shared-pages/notifications.dart';
import 'package:needlinc/needlinc/business-pages/profile.dart';
import 'package:needlinc/needlinc/client-pages/people.dart';
import 'package:needlinc/needlinc/shared-pages/product-details.dart';
import 'package:needlinc/needlinc/shared-pages/settings.dart';
import '../backend/user-account/upload-post.dart';
import '../shared-pages/market-place-post.dart';
import 'package:needlinc/needlinc/business-pages/business-main.dart';
import 'package:needlinc/needlinc/shared-pages/comments.dart';
import '../../main.dart';
import '../colors/colors.dart';
import 'package:needlinc/needlinc/shared-pages/chat-pages/messages.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {
  CollectionReference marketPlacePosts =
  FirebaseFirestore.instance.collection('marketPlacePage');
  CollectionReference user = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO(Already done) This is the App Menu Bar
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: NeedlincColors.blue3,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BusinessMainPages(
                                                  currentPage: 4)));
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
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
                                padding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Richard John",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                    Container(
                                      color: NeedlincColors.black2,
                                      width: 180,
                                      height: 2.0,
                                      margin: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                    )
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
              leading: const Icon(
                Icons.settings,
                color: NeedlincColors.blue2,
              ),
              title: const Text('Settings',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()))
              },
            ),
            const Divider(),
            ListTile(
                leading: const Icon(
                  Icons.input,
                  color: NeedlincColors.blue2,
                ),
                title: const Text('Back to Home',
                    style: TextStyle(color: NeedlincColors.blue2)),
                onTap: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()))
                }),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.shopping_cart_outlined,
                color: NeedlincColors.blue2,
              ),
              title: const Text('Marketplace',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MarketPlacePostPage()))
              },
            ),
            const Divider(),
            ListTile(
              leading:
              const Icon(Icons.people_outline, color: NeedlincColors.blue2),
              title: const Text('Freelancers',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => PeoplePage()))
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: NeedlincColors.blue2,
              ),
              title: const Text('Notifications',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationsPage()))
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: NeedlincColors.blue2,
              ),
              title: const Text('Profile',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()))
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.question_mark,
                color: NeedlincColors.blue2,
              ),
              title: const Text('FAQs/Help',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.headset_mic,
                color: NeedlincColors.blue2,
              ),
              title: const Text('Contact Us',
                  style: TextStyle(color: NeedlincColors.blue2)),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      // TODO(Already done) This is the AppBar
      appBar: AppBar(
        backgroundColor: NeedlincColors.white,
        elevation: 5.0,
        shadowColor: NeedlincColors.black1,
        iconTheme: const IconThemeData(color: NeedlincColors.blue1),
        title: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                child: const Text(
                  "MARKET PLACE",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                )),
            Container(
              height: 35,
              width: 300,
              margin: const EdgeInsets.only(bottom: 5.0, top: 7.5),
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
              decoration: BoxDecoration(
                color: NeedlincColors.black3,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.search),
                  const SizedBox(width: 2.0),
                  const VerticalDivider(
                    thickness: 2,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
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
          ],
        ),
        actions: [
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    icon: const Icon(Icons.message),
                    onPressed: () {
                      // Chat messaging feature
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Messages()),
                      );
                    },
                  ),
                  //TODO This container is for the small circular profile  picture  at the app bar in the market place page
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BusinessMainPages(currentPage: 4)));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                      decoration: const BoxDecoration(
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
                      color: NeedlincColors.black2
                          .withOpacity(0.8), // Shadow color
                      spreadRadius: 4, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset:
                      const Offset(0, 6), // Offset in the form of (dx, dy)

                    ),
                  ],
                ),
                child: IconButton(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  icon: const Icon(
                    Icons.draw_outlined,
                    color: NeedlincColors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MarketPlacePostPage()));
                  },
                ),
              ),
            ],
          ),
        ],
        toolbarHeight: 95,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: user.doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> userSnapshot) {
          if (userSnapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          Map<String, dynamic>? userDetails =
          userSnapshot.data!.data() as Map<String, dynamic>;

          return StreamBuilder<QuerySnapshot>(
            stream: marketPlacePosts.snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> postsSnapshot) {
              if (postsSnapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (postsSnapshot.connectionState == ConnectionState.active ||
                  postsSnapshot.connectionState == ConnectionState.done) {
                List<DocumentSnapshot> dataList = postsSnapshot.data!.docs;
                return ListView.builder(
                    itemCount: dataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = dataList[index].data() as Map<String, dynamic>;
                      Map<String, dynamic>? productDetails =
                      data['productDetails'];

                      if (productDetails == null) {
                        // Handle the case when productDetails are missing in a document.
                        return const Text("Product details not found");
                      }

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetailsPage(
                                    userDetails: data['userDetails'],
                                    productDetails: data['productDetails'],
                                  )));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 6.0),
                          padding:
                          const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 12.0),
                          decoration: BoxDecoration(
                            color: NeedlincColors.white,
                            boxShadow: [
                              BoxShadow(
                                color: NeedlincColors.black3
                                    .withOpacity(0.8), // Shadow color
                                spreadRadius: 4, // Spread radius
                                blurRadius: 5, // Blur radius
                                offset: const Offset(
                                    0, 6), // Offset in the form of (dx, dy)
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BusinessMainPages(currentPage: 4),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(25),
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            userDetails["profilePicture"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        color: NeedlincColors.black3,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              userDetails["userName"],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Text(
                                              "🟢 Now",
                                              style: TextStyle(fontSize: 9),
                                            ),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.more_horiz))
                                          ],
                                        ),
                                        Text("~${userDetails['userCategory']}",
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600)),
                                        Text("📍 ${userDetails['address']}",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: NeedlincColors.black2))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.fromLTRB(
                                    70.0, 0.0, 0.0, 10.0),
                                child: Text(productDetails['name'],
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.fromLTRB(
                                    70.0, 0.0, 0.0, 10.0),
                                child: Text("₦ ${productDetails['price']}",
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.green)),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.fromLTRB(
                                    70.0, 0.0, 0.0, 10.0),
                                child: Text(
                                    productDetails['description'].length >= 123
                                        ? productDetails['description']
                                        .substring(0, 123)
                                        : productDetails['description'],
                                    style: const TextStyle(fontSize: 18)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                MediaQuery.of(context).size.width * 0.55,
                                margin: const EdgeInsets.fromLTRB(
                                    70.0, 0.0, 10.0, 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "${productDetails["images"][0]}",
                                    ),
                                    fit: BoxFit.cover,
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
                                          onPressed: () {
                                            UploadPost().uploadHearts(
                                                context: context,
                                                sourceOption: 'marketPlacePage',
                                                id: productDetails[
                                                'productId']);
                                          },
                                          icon: productDetails['hearts']
                                              .contains(
                                              userDetails['userId'])
                                              ? Icon(
                                            Icons.favorite,
                                            size: 22,
                                            color: NeedlincColors.red,
                                          )
                                              : Icon(
                                            Icons.favorite_border,
                                            size: 22,
                                          )),
                                      Text("${productDetails['hearts'].length}",
                                          style: const TextStyle(fontSize: 15))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CommentsPage(
                                                          post: data,
                                                          sourceOption:
                                                          'marketPlacePage',
                                                        )));
                                          },
                                          icon: const Icon(
                                              Icons.maps_ugc_outlined,
                                              size: 20)),
                                      Text(
                                          "${productDetails['comments'].length}",
                                          style: const TextStyle(fontSize: 15))
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.bookmark_border,
                                          size: 20)),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 22)),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.share, size: 20))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }

              if (postsSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }
}
